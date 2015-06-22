# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb

class Gtest < Formula
  desc ""
  homepage ""
  url "https://googletest.googlecode.com/files/gtest-1.7.0.zip"
  version "1.7"
  sha256 "247ca18dd83f53deb1328be17e4b1be31514cedfc1e3424f672bf11fd7e0d60d"

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
