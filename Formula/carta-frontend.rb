class CartaFrontend < Formula
  desc "Frontend interface for CARTA"
  homepage "https://github.com/CARTAvis/carta-frontend"
  url "http://alma.asiaa.sinica.edu.tw/_downloads/built-carta-frontend.tar.gz"
  version "2.0.0"
  sha256 "eede630a9f9a45ea4294421782f253c7b478fd8b0d32e2f5b51fec248ae8d873"
  license "GPL-3.0-only"

  depends_on "go" => :build

  def install
    mkdir_p "#{share}/carta/frontend"
    cp_r buildpath/".", share/"carta/frontend"
  end

  test do
    assert_true Dir.exist?(share/"carta/frontend")
  end
end
