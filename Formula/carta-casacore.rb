class CartaCasacore < Formula
  desc "This is carta-casacore used by CARTA"
  homepage "https://github.com/CARTAvis/carta-casacore"
  url "http://alma.asiaa.sinica.edu.tw/_downloads/carta-casacore.tar.gz"
  version "3.0.0"
  sha256 "d43a430e712ad45679cd7caed5cac94fb6f6bed3063f82c8b2afd74f932ec918"
  license "GPL-2.0-only"

  depends_on "cmake" => :build
  depends_on "cfitsio"
  depends_on "fftw"
  depends_on "gcc"
  depends_on "gsl"
  depends_on "hdf5"
  depends_on "lapack" # for linux
  depends_on "openblas" # for linux
  depends_on "wcslib"

  def install
    mkdir_p "#{share}/casacore/data"
    system "svn co https://svn.cv.nrao.edu/svn/casa-data/distro/ephemerides/"
    system "svn co https://svn.cv.nrao.edu/svn/casa-data/distro/geodetic/"
    cp_r buildpath/"ephemerides", share/"casacore/data"
    cp_r buildpath/"geodetic", share/"casacore/data"

    ENV["FCFLAGS"] = "-w -fallow-argument-mismatch -O2"
    ENV["FFLAGS"] = "-w -fallow-argument-mismatch -O2"
    mkdir "build" do
      system "cmake", "..", "-DUSE_FFTW3=ON",
                            "-DUSE_HDF5=ON",
                            "-DUSE_THREADS=ON",
                            "-DUSE_OPENMP=ON",
                            "-DCMAKE_BUILD_TYPE=Release",
                            "-DBUILD_TESTING=OFF",
                            "-DBUILD_PYTHON=OFF",
                            "-DUseCcache=1",
                            "-DHAS_CXX11=1", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    assert_match "casacore built with HDF5 support", shell_output("#{bin}/casahdf5support")
  end
end
