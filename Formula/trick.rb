# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula

class Trick < Formula
  desc "Trick Simulation Environment. Trick provides a common set of simulation capabilities and utilities to build simulations automatically."
  homepage "https://github.com/nasa/trick"
  url "https://github.com/nasa/trick/archive/17.0.2.tar.gz"
  version "17.0.2"
  sha256 "1afa7ae1c857dfb5ed955b0de3586107a3fde7da146097ebf3c182c4647e90cb"

  env :std

  depends_on :java
  depends_on :x11
  depends_on "llvm" => :build
  depends_on "swig"
  depends_on "gsl" => :optional
  depends_on "hdf5" => :optional

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
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
    system "false"
  end
end
