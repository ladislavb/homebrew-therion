class Therion < Formula
  desc "Processes survey data and generates maps or 3D models of caves"
  homepage "https://therion.speleo.sk"
  #url "https://github.com/therion/therion.git", revision: "75d20fd"
  url "https://github.com/therion/therion/archive/v6.1.2.tar.gz"
  sha256 "be1324b7d9888a6aeaa777870c8320e13cf60ee9e40c14b486dbce4c50160c2f"
  version "6.1.2"
  revision 3
  head "https://github.com/therion/therion.git"

  depends_on "cmake" => :build
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
