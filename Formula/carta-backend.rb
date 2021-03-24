class CartaBackend < Formula
  desc "Source code repository for the backend component of CARTA"
  homepage "https://cartavis.github.io/"
  url "http://alma.asiaa.sinica.edu.tw/_downloads/carta-backend-v2.0.0-dev.21.03.05.tgz"
  version "2.0.0"
  sha256 "51eb71cf6a92720d7263398e48586fadf93901fb1f436b0d0775a22766ccd086"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/CARTAvis/homebrew-tap/releases/download/carta-backend-2.0.0"
    sha256 cellar: :any,                 catalina:     "a78452365ace9930247bbcfc645e8af3f8c07e1b1c68dfc3b408164b16f72869"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c57f840313c726c2949a58602e206010e0147ea70e3951aa0c3b5e4818a96ca3"
  end

  depends_on "cmake" => :build
  depends_on "ajm-asiaa/test6/carta-frontend"
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

  def install
    ENV["OPENSSL_ROOT_DIR"] = "$(brew --prefix openssl)"

    path = HOMEBREW_PREFIX/"Cellar/carta-casacore/3.0.0/include"

    mkdir "build" do
      system "cmake", "..", "-DCMAKE_PREFIX_PATH=#{lib}",
                            "-DCMAKE_INCLUDE_PATH=#{include}",
                            "-DCMAKE_CXX_FLAGS=-I#{path}/casacode -I#{path}/casacore",
                            "-DCMAKE_CXX_STANDARD_LIBRARIES=-L#{lib}", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    assert_match "2.0.0-dev.21.03.04", shell_output("#{bin}/carta_backend --version")
  end
end
