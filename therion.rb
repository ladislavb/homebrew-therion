class Therion < Formula
  homepage "https://therion.speleo.sk"
  desc "Processes survey data and generates maps or 3D models of caves"
  revision 1

  url "https://github.com/therion/therion.git", :revision => "3ec70c6"
  version "5.4.1+3ec70c6"

  head "https://github.com/therion/therion.git"
  
  depends_on "pkg-config"
  depends_on "proj"
  depends_on "freetype"
  depends_on "imagemagick"
  depends_on "lcdf-typetools"
  depends_on "vtk"
  depends_on "wxmac"
  depends_on "tcl-tk" if MacOS.version >= :sierra

  def install
    inreplace "makeinstall.tcl" do |s|
      s.gsub! "/usr/local/bin", bin
      s.gsub! "/usr/local/etc", etc
      s.gsub! "/Applications", prefix
    end

    etc.mkpath
    bin.mkpath

    ENV.prepend_path "PATH", "/Library/TeX/texbin:/opt/X11/bin:/usr/local/opt/tcl-tk/bin:/usr/local/bin"
    ENV.prepend_path "PKG_CONFIG_PATH", "/usr/local/opt/proj/lib/pkgconfig"

    system "make", "config-macosx"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/therion", "--version"
  end
end
