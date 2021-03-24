class CartaFrontend < Formula
  desc "Frontend interface for CARTA"
  homepage "https://github.com/CARTAvis/carta-frontend"
  url "http://alma.asiaa.sinica.edu.tw/_downloads/carta-frontend.tar.gz"
  version "2.0.0"
  sha256 "9729bb29f245256ca17b76cd4e45c7138103511dc530af305257e76356225b1d"
  license "GPL-3.0-only"

  depends_on "go" => :build

  def install
    mkdir_p "#{share}/carta"
    mv prefix/"frontend", share/"carta/"
  end

  test do
    assert_true Dir.exist?(share/"carta/frontend")
  end
end
