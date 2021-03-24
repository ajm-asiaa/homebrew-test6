class CartaFrontend < Formula
  desc "Frontend interface for CARTA"
  homepage "https://github.com/CARTAvis/carta-frontend"
  url "http://alma.asiaa.sinica.edu.tw/_downloads/frontend.tar.gz"
  version "2.0.0"
  sha256 "2450a8d098f4a088f2e8615721c2ee71f2fe9b194e1db47711f72bb4c4c74737"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/ajm-asiaa/homebrew-test6/releases/download/carta-frontend-2.0.0"
    sha256 cellar: :any_skip_relocation, catalina:     "6a04b81025b86f9f55c7a61288251ef298dd188265031a60cea1c949a6a07aba"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4d4f977efc9e6aff98125a232d4ee31266c531999db4a408724b81fae9866240"
  end

  depends_on "go" => :build

  def install
    mkdir_p "#{share}/carta"
    cp_r buildpath/".", share/"carta/"
  end

  test do
    assert_true Dir.exist?(share/"carta/frontend")
  end
end
