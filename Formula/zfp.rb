class Zfp < Formula
  desc "Compressed numerical arrays that support high-speed random access"
  homepage "https://github.com/LLNL/zfp"
  url "https://github.com/LLNL/zfp/releases/download/0.5.5/zfp-0.5.5.tar.gz"
  sha256 "fdf7b948bab1f4e5dccfe2c2048fd98c24e417ad8fb8a51ed3463d04147393c5"
  license "BSD-3-Clause"

  bottle do
    root_url "https://github.com/ajm-asiaa/homebrew-test6/releases/download/zfp-0.5.5"
    sha256 cellar: :any,                 catalina:     "a230fce8ca7722842f4f23b634c90fbdda68a37309ee4a79eaf4083b8527200e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "07ac5a02d8ede404175da015c74e64ab0529dc570d22da1f1c161aa4336b016f"
  end
  depends_on "cmake" => :build
  def install
    mkdir "build" do
      system "cmake", "..", "-DBUILD_EXAMPLES=OFF",
                            "-DZFP_WITH_OPENMP=OFF", *std_cmake_args
      system "make", "install", "PREFIX=#{prefix}/"
    end
  end

  test do
    assert_true Dir.exist?(lib)
  end
end
