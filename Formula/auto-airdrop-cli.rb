class AutoAirdropCli < Formula
  desc "AirDrop files to a named device without manual clicks"
  homepage "https://github.com/owensantoso/auto-airdrop-cli"
  url "https://github.com/owensantoso/auto-airdrop-cli/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "a33f722bbc10ca8c445cd2c47751ea5defacd1640df21083cabb726321d8af00"
  license "MIT"

  depends_on :macos

  def install
    system "swiftc", "-O", "libexec/airdrop.swift", "-o", "airdrop-launcher"
    bin.install "bin/auto-airdrop"
    libexec.install "airdrop-launcher"
    libexec.install Dir["libexec/*"]
  end

  test do
    assert_match "auto-airdrop 0.3.1", shell_output("#{bin}/auto-airdrop --version")
    assert_match "Usage: auto-airdrop [OPTIONS] FILE DEVICE_NAME", shell_output("#{bin}/auto-airdrop --help")
  end
end
