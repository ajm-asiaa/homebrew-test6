class CartaFrontend < Formula
  desc "Frontend interface for CARTA"
  homepage "https://github.com/CARTAvis/carta-frontend"
  url "https://registry.npmjs.org/carta-frontend/-/carta-frontend-2.0.0-dev.21.3.05b.tgz"
  sha256 "6cfc3a63bb917d38c41a946986cd19bc14bc5b8ece437e2e2877842b1879d55a"
  license "GPL-3.0-only"

  depends_on "go" => :build

  def install
    mkdir_p "#{share}/carta/frontend"
    cp_r buildpath/"build/.", share/"carta/frontend"
  end

  test do
    assert_true Dir.exist?(share/"carta/frontend")
  end
end
