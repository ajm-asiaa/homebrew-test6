require "language/node"

class CartaFrontend < Formula
  desc "The frontend interface for CARTA"
  homepage "github.com/CARTAvis/carta-frontend"
  url "https://github.com/CARTAvis/carta-frontend/archive/refs/tags/v2.0.0-dev.21.01.22.tar.gz"
  version "2.0.0"
  sha256 "052f3e1bb5c7fdf185964a24255237732b0a5a5cb0f78f469dadb9e12dfd4783"
  license "GPL-3.0-only"

  depends_on "node"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "npm", "install", "carta-frontend", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_true Dir.exist?(share/frontend)
  end
end
