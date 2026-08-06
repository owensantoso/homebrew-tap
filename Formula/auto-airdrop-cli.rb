class AutoAirdropCli < Formula
  desc "AirDrop files to a named device without manual clicks"
  homepage "https://github.com/owensantoso/auto-airdrop-cli"
  url "https://github.com/owensantoso/auto-airdrop-cli/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "45e8882d4c8d0308ef1124bcd5e41526567dc53238423b766335bb575a3aabd1"
  license "MIT"

  depends_on :macos

  def install
    system "swiftc", "-O", "libexec/airdrop.swift", "-o", "airdrop-launcher"
    bin.install "bin/auto-airdrop"
    libexec.install "airdrop-launcher"
    libexec.install Dir["libexec/*"]
  end

  test do
    assert_match "auto-airdrop 0.4.0", shell_output("#{bin}/auto-airdrop --version")
    assert_match "Usage: auto-airdrop [OPTIONS] FILE DEVICE_NAME", shell_output("#{bin}/auto-airdrop --help")
  end
end
