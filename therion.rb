class Therion < Formula
  desc "Processes survey data and generates maps or 3D models of caves"
  homepage "https://therion.speleo.sk"
  url "https://github.com/therion/therion.git",
    :using => :git, 
    :tag => 'master',
    :revision => "0133c2ec73c76d37861789c9c0bee84c24c6e166"
	version '5.4.x'

  depends_on "freetype"
  depends_on "imagemagick"
  depends_on "lcdf-typetools"
  depends_on "vtk"
  depends_on "wxmac"
  depends_on "tcl-tk" if MacOS.version >= :sierra

  def install
    inreplace "Makefile", "all: version outdirs $(OUTDIR)/therion doc ",
                          "all: version outdirs $(OUTDIR)/therion "

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
