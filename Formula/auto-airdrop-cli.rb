class AutoAirdropCli < Formula
  desc "AirDrop files to a named device without manual clicks"
  homepage "https://github.com/owensantoso/auto-airdrop-cli"
  url "https://github.com/owensantoso/auto-airdrop-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "90689046aed1f5103ea1af661db380bed01d958e53abd42d384268871c1c970a"
  license "MIT"

  depends_on :macos

  def install
    bin.install "bin/auto-airdrop"
    libexec.install Dir["libexec/*"]
  end

  test do
    assert_match "Usage: auto-airdrop FILE DEVICE_NAME", shell_output("#{bin}/auto-airdrop 2>&1", 2)
  end
end
