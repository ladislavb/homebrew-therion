class TherionAT541 < Formula
  desc "Processes survey data and generates maps or 3D models of caves"
  homepage "https://therion.speleo.sk"
  url "https://therion.speleo.sk/downloads/therion-5.4.1.tar.gz"
  sha256 "6e4b88d1803bdf252cf7d4632afcd9c4005e387245e9ac95774e6cc894ae4ccd"
  revision 1

  depends_on "freetype"
  depends_on "imagemagick"
  depends_on "lcdf-typetools"
  depends_on "vtk"
  depends_on "wxmac"
  depends_on "tcl-tk" if MacOS.version >= :sierra

  def install
    inreplace "Makefile", "all: outdirs $(OUTDIR)/therion doc ",
                          "all: outdirs $(OUTDIR)/therion "

    inreplace "makeinstall.tcl" do |s|
      s.gsub! "/usr/bin", bin
      s.gsub! "/etc", etc
      s.gsub! "/Applications", prefix
    end

    etc.mkpath
    bin.mkpath

    system "make", OS.mac? ? "config-macosx" : "config-linux"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/therion", "--version"
  end
end