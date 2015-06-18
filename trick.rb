# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb

class Trick < Formula
  desc ""
  homepage ""
  url "https://github.com/nasa/trick/archive/master.tar.gz"
  version "test"
  sha256 ""

  depends_on :java
  depends_on :x11
  depends_on "llvm" => "with-clang"
  depends_on "swig"
  depends_on "openmotif" if build.with? "jscdirs"

  resource "er7utils" do
      url "https://nexus.jsc.nasa.gov/svn/er7_utils/trunk/er7_utils", :using => :svn
  end

  resource "fermi" do
      url "https://tricklab.jsc.nasa.gov/svn/repos/trick/trick/trunk/trick_source/data_products/fermi-ware", :using => :svn
  end

  option "with-jscdirs", "Build JSC specific directories"

  def install
    if build.with? "jscdirs"
      (buildpath/"trick_source/er7utils").install resource("er7utils")
      (buildpath/"trick_source/data_products/fermi-ware").install resource("fermi")
    end

    system "./configure", "--prefix=#{prefix}",
                          "--with-llvm=/usr/local/opt/llvm"
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
