class TherionAT541 < Formula
  desc "Processes survey data and generates maps or 3D models of caves"
  homepage "https://therion.speleo.sk"
  url "https://therion.speleo.sk/downloads/therion-5.4.1.tar.gz"
  sha256 "f1b8552e977cdbb5837703e9cadaa4694bfd997c2bd1358b5b21ef87837fda05"
  revision 1

  depends_on "freetype"
  depends_on "imagemagick"
  depends_on "lcdf-typetools"
  depends_on "vtk"
  depends_on "wxmac"

  def install
    inreplace "Makefile", "all: version outdirs $(OUTDIR)/therion doc ", "all: version outdirs $(OUTDIR)/therion "

    inreplace "makeinstall.tcl" do |s|
      s.gsub! "/usr/bin", bin
      s.gsub! "/etc", etc
      s.gsub! "/Applications", prefix
    end
	
	inreplace "thbezier.cxx", "#include <math.h>", "#include <cmath>"
	
	inreplace "loch/Makefile", "CXXPFLAGS = -W -Wall -DLXMACOSX", "CXXPFLAGS = -W -Wall -std=c++11 -DLXMACOSX"

    etc.mkpath
    bin.mkpath
	(buildpath/"loch/loch.app/Contents/MacOS").mkpath

    system "make", OS.mac? ? "config-macosx" : "config-linux"
    system "make"
    system "make", "install"
	
	("/usr/local/bin").install_symlink bin/"therion"
	("/usr/local/bin").install_symlink bin/"xtherion"
  end

  test do
    system "#{bin}/therion", "--version"
  end
end