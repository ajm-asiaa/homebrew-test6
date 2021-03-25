class CartaBeta < Formula
  desc "Carta-backend and carta-frontend components of CARTA"
  homepage "https://cartavis.github.io/"
  url "https://github.com/CARTAvis/carta-backend.git", tag: "v2.0.0-dev.21.03.05"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/ajm-asiaa/homebrew-test6/releases/download/carta-beta-21.03.05"
    sha256 cellar: :any,                 catalina:     "1101b825a1c68bab572a4b4f597560ddf6f610a651079c58141ef2c6d4f0e07b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dc0ad45a5a7af4e124dfb4da1257641bc393555684b0de6f1e28a5bc762f2dab"
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
    system "git", "submodule", "update", "--recursive", "--init"
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
