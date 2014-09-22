require 'formula'

class Openmotif < Formula
  url 'https://downloads.sourceforge.net/project/motif/Motif%202.3.4%20Source%20Code/motif-2.3.4-src.tgz'
  homepage 'http://sourceforge.net/projects/motif/'
  sha256 '637efa09608e0b8f93465dbeb7c92e58ebb14c4bc1b488040eb79a65af3efbe0'

  def install
    ENV.deparallelize
    system "./configure", "--disable-dependency-tracking",
    "--prefix=#{prefix}", "--enable-xft", "--enable-jpeg", "--enable-png"
    system "make install"
  end

  def patches
    # MacPorts patches
    { :p0 => ['https://trac.macports.org/export/83688/trunk/dports/x11/openmotif/files/patch-uintptr_t-cast.diff',
              'https://trac.macports.org/export/83688/trunk/dports/x11/openmotif/files/patch-lib-Mrm-Makefile.in.diff',
              'https://trac.macports.org/raw-attachment/ticket/30898/patch-demos-programs-periodic-Makefile.in.diff',
              'https://trac.macports.org/raw-attachment/ticket/30898/patch-clients-uil-UilDefI.h.diff']
    }
  end
end
