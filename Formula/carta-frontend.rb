class CartaFrontend < Formula
  desc "Frontend interface for CARTA"
  homepage "https://github.com/CARTAvis/carta-frontend"
  url "http://alma.asiaa.sinica.edu.tw/_downloads/built-carta-frontend.tar.gz"
  version "2.0.0"
  sha256 "eede630a9f9a45ea4294421782f253c7b478fd8b0d32e2f5b51fec248ae8d873"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/ajm-asiaa/homebrew-test6/releases/download/carta-frontend-2.0.0"
    sha256 cellar: :any_skip_relocation, catalina:     "1fea0aa75217b6ba2889c88ea60b34f7e8549e62c5dd61dedf03585876da3f01"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "893d37d0ff4bc207c5731b1fe8f543ddac57d7af5e4e84bc0d7fb65a3146d92c"
  end

  depends_on "go" => :build

  def install
    mkdir_p "#{share}/carta/frontend"
    cp_r buildpath/".", share/"carta/frontend"
  end

  test do
    assert_true Dir.exist?(share/"carta/frontend")
  end
end
