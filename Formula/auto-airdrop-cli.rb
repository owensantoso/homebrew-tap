class AutoAirdropCli < Formula
  desc "AirDrop files and folders to devices without manual clicks"
  homepage "https://github.com/owensantoso/auto-airdrop-cli"
  url "https://github.com/owensantoso/auto-airdrop-cli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "e100a7b0303d461ecdb773c70016594386817d25e4a0aaaed55d8b4a3c1e252d"
  license "MIT"

  depends_on :macos

  def install
    system "swiftc", "-O", "libexec/airdrop.swift", "-o", "airdrop-launcher"
    bin.install "bin/auto-airdrop"
    libexec.install "airdrop-launcher"
    libexec.install Dir["libexec/*"]
  end

  test do
    assert_match "auto-airdrop 0.5.0", shell_output("#{bin}/auto-airdrop --version")
    assert_match "--pick", shell_output("#{bin}/auto-airdrop --help")
  end
end
