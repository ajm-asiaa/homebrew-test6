class Zfp < Formula
  desc "Compressed numerical arrays that support high-speed random access"
  homepage "https://github.com/LLNL/zfp"
  url "https://github.com/LLNL/zfp/releases/download/0.5.5/zfp-0.5.5.tar.gz"
  sha256 "fdf7b948bab1f4e5dccfe2c2048fd98c24e417ad8fb8a51ed3463d04147393c5"
  license "BSD-3-Clause"
  depends_on "cmake" => :build
  def install
    mkdir "build" do
      system "cmake", "..", "-DBUILD_EXAMPLES=OFF",
                            "-DZFP_WITH_OPENMP=OFF", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    assert_match "zfp version 0.5.5 (May 5, 2019)", shell_output("#{bin}/zfp").first
  end
end
