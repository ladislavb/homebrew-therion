class Therion < Formula
  desc "Processes survey data and generates maps or 3D models of caves"
  homepage "https://therion.speleo.sk"
  #url "https://github.com/therion/therion.git", revision: "75d20fd"
  url "https://github.com/therion/therion/archive/v6.2.0.tar.gz"
  sha256 "8742f77859cbbe122c9b853135543e6a02bcd940dac6aa2f2fac7effc8d0c990"
  version "6.2.0"
  revision 3
  head "https://github.com/therion/therion.git"

  depends_on "catch2" => :build
  depends_on "cmake" => :build
  depends_on "fmt" => :build
  depends_on "freetype"
  depends_on "ghostscript"
  depends_on "imagemagick"
  depends_on "lcdf-typetools"
  depends_on "libjpeg"
  depends_on "libpng"
  depends_on "pkg-config"
  depends_on "proj"
  depends_on "tcl-tk"
  depends_on "vtk"
  depends_on "wxwidgets"
  depends_on "zlib"

  def install
    inreplace "loch/CMakeLists.txt" do |s|
      s.gsub! "/Applications", prefix
    end

    ENV.prepend_path "PATH", "/Library/TeX/texbin"

    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  def caveats
    "Copy Loch.app to your /Applications folder: cp -R #{prefix}/loch.app/ /Applications/loch.app"
  end

  test do
    system "#{bin}/therion", "--version"
  end
end
