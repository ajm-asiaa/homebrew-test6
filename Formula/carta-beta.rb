class CartaBeta < Formula
  desc "Carta-backend and carta-frontend components of CARTA"
  homepage "https://cartavis.github.io/"
  url "http://alma.asiaa.sinica.edu.tw/_downloads/carta-backend-v2.0.0-dev.21.03.05.tgz"
  sha256 "51eb71cf6a92720d7263398e48586fadf93901fb1f436b0d0775a22766ccd086"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/ajm-asiaa/homebrew-test6/releases/download/carta-beta-21.03.05"
    sha256 cellar: :any,                 catalina:     "c4e686200509b6c4a66cd3ee51c9f47ba93f0e7b8dd642006e290c2ade437073"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bf7c55175d7310da84163c28b688d67f5a30caf8c98cc7f8e037a0313a1ec5cb"
  end

  depends_on "cmake" => :build
  depends_on "cartavis/tap/carta-casacore"
  depends_on "cartavis/tap/zfp"
  depends_on "curl"
  depends_on "fmt"
  depends_on "grpc"
  depends_on "libomp"
  depends_on "libuv"
  depends_on "protobuf"
  depends_on "pugixml"
  depends_on "tbb"
  depends_on "zstd"

  resource "frontend" do
    url "https://registry.npmjs.org/carta-frontend/-/carta-frontend-2.0.0-dev.21.3.05b.tgz"
    sha256 "6cfc3a63bb917d38c41a946986cd19bc14bc5b8ece437e2e2877842b1879d55a"
  end

  def install
    # Building the carta-backend
    ENV["OPENSSL_ROOT_DIR"] = "$(brew --prefix openssl)"

    path = HOMEBREW_PREFIX/"Cellar/carta-casacore/3.0.0/include"

    mkdir "build-backend" do
      system "cmake", "..", "-DCMAKE_PREFIX_PATH=#{lib}",
                            "-DCMAKE_INCLUDE_PATH=#{include}",
                            "-DCMAKE_CXX_FLAGS=-I#{path}/casacode -I#{path}/casacore",
                            "-DCMAKE_CXX_STANDARD_LIBRARIES=-L#{lib}", *std_cmake_args
      system "make", "install"
    end

    # Grabing the pre-built carta-frontend from the npm repository.
    resource("frontend").stage do
      mkdir_p "#{share}/carta/frontend"
      cp_r "build/.", share/"carta/frontend"
    end
  end

  test do
    assert_match "2.0.0-dev.21.03.04", shell_output("#{bin}/carta_backend --version")
    assert_true Dir.exist?(share/"carta/frontend")
  end
end