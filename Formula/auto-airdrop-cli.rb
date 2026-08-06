class AutoAirdropCli < Formula
  desc "AirDrop files and folders to devices without manual clicks"
  homepage "https://github.com/owensantoso/auto-airdrop-cli"
  url "https://github.com/owensantoso/auto-airdrop-cli/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "e61ef1d078ec4a12b5b76359b779f5ffc21ef212d139bd7de65fa015ea0594fd"
  license "MIT"

  depends_on :macos

  def install
    system "swiftc", "-O", "libexec/airdrop.swift", "-o", "airdrop-launcher"
    bin.install "bin/auto-airdrop"
    libexec.install "airdrop-launcher"
    libexec.install Dir["libexec/*"]
  end

  test do
    assert_match "auto-airdrop 0.6.0", shell_output("#{bin}/auto-airdrop --version")
    assert_match "--pick", shell_output("#{bin}/auto-airdrop --help")
    assert_match "finder install", shell_output("#{bin}/auto-airdrop finder --help")
  end
end
