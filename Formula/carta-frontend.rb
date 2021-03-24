class CartaFrontend < Formula
  desc "Frontend interface for CARTA"
  homepage "https://github.com/CARTAvis/carta-frontend"
  url "https://registry.npmjs.org/carta-frontend/-/carta-frontend-2.0.0-dev.21.3.05b.tgz"
  sha256 "6cfc3a63bb917d38c41a946986cd19bc14bc5b8ece437e2e2877842b1879d55a"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/ajm-asiaa/homebrew-test6/releases/download/carta-frontend-2.0.0"
    sha256 cellar: :any_skip_relocation, catalina:     "907dd6949a0f1e67f0f6b71d30a2622da27dbe8234358b9df5a0105c050b609c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e220dbe95bc9a86f23ea9306f2b718daeac2f611961105b15dbae81c0eafe498"
  end

  depends_on "go" => :build

  def install
    mkdir_p "#{share}/carta/frontend"
    cp_r buildpath/"build/.", share/"carta/frontend"
  end

  test do
    assert_true Dir.exist?(share/"carta/frontend")
  end
end
