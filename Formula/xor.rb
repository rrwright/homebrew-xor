class Xor < Formula
  desc "Fast Unix-style XOR utility for cryptographic operations"
  homepage "https://github.com/rrwright/xor"
  url "https://github.com/rrwright/xor/archive/v1.0.0.tar.gz"
  sha256 "ca386e456b5cb6fe23917e3bb41a29e926ca6c38c7af6608f10ce00ded54b0e7"
  license "BSD-3-Clause"
  version "1.0.0"

  def install
    system "make"
    bin.install "xor"
  end

  test do
    # Test version output
    assert_match "xor 1.0.0", shell_output("#{bin}/xor --version")
    
    # Test basic functionality
    (testpath/"test1.txt").write("hello")
    (testpath/"test2.txt").write("world")
    system "#{bin}/xor", "test1.txt", "test2.txt"
  end
end