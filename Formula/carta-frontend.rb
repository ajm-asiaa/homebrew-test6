class CartaFrontend < Formula
  desc "Frontend interface for CARTA"
  homepage "https://github.com/CARTAvis/carta-frontend"
  url "http://alma.asiaa.sinica.edu.tw/_downloads/frontend.tar.gz"
  version "2.0.0"
  sha256 "2450a8d098f4a088f2e8615721c2ee71f2fe9b194e1db47711f72bb4c4c74737"
  license "GPL-3.0-only"

  depends_on "go" => :build

  def install
    mkdir_p "#{share}/carta"
    cp_r buildpath/".", share/"carta/"
  end

  test do
    assert_true Dir.exist?(share/"carta/frontend")
  end
end
