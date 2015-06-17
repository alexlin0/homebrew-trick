# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Trick < Formula
  desc ""
  homepage ""
  url "https://github.com/nasa/trick/archive/master.tar.gz"
  version "test"
  sha256 ""

  # depends_on "cmake" => :build
  depends_on :java
  depends_on :x11
  depends_on "llvm" => "with-clang"
  depends_on "swig"
  depends_on "openmotif"

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
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test trick`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
