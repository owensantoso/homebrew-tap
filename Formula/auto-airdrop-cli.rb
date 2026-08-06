class AutoAirdropCli < Formula
  desc "AirDrop files and folders to devices without manual clicks"
  homepage "https://github.com/owensantoso/auto-airdrop-cli"
  url "https://github.com/owensantoso/auto-airdrop-cli/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "138debcfa039155098c06abf2b1bb16dfe5c81626d2c89cc149e4024b35cc5a9"
  license "MIT"

  depends_on :macos

  def install
    system "swiftc", "-O", "libexec/airdrop.swift", "-o", "airdrop-launcher"
    bin.install "bin/auto-airdrop"
    libexec.install "airdrop-launcher"
    libexec.install Dir["libexec/*"]
  end

  test do
    assert_match "auto-airdrop 0.7.0", shell_output("#{bin}/auto-airdrop --version")
    assert_match "--pick", shell_output("#{bin}/auto-airdrop --help")
    assert_match "--json", shell_output("#{bin}/auto-airdrop --help")
    assert_match "finder install", shell_output("#{bin}/auto-airdrop finder --help")
  end
end
