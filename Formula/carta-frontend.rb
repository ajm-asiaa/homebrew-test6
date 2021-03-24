require "language/node"

class CartaFrontend < Formula
  desc "Frontend interface for CARTA"
  homepage "https://github.com/CARTAvis/carta-frontend"
  url "https://github.com/CARTAvis/carta-frontend/archive/refs/tags/v2.0.0-dev.21.01.22.tar.gz"
  version "2.0.0"
  sha256 "052f3e1bb5c7fdf185964a24255237732b0a5a5cb0f78f469dadb9e12dfd4783"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/ajm-asiaa/homebrew-test6/releases/download/carta-frontend-2.0.0"
    sha256 cellar: :any_skip_relocation, catalina:     "bf979c6f76232e07bb97829372c2c71d24ef86c21d1393c63ae46ebda01bcb3d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1710dd6d2cb89e84dd54b744cd5ad279cfe24e3e4a96d0e42b6ce7ca459028a3"
  end

  depends_on "node"

  def install
    system "npm", "install", "carta-frontend@2.0.0-dev.21.3.05b", *Language::Node.std_npm_install_args(libexec)
  end

  test do
    assert_true Dir.exist?(prefix)
  end
end
