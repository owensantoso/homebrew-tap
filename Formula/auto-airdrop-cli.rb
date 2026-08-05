class AutoAirdropCli < Formula
  desc "AirDrop files to a named device without manual clicks"
  homepage "https://github.com/owensantoso/auto-airdrop-cli"
  url "https://github.com/owensantoso/auto-airdrop-cli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "61d7bcae0c6eaa86638e0220a2f9919e56ceeefecde2a6d51b37c8b4a5975f50"
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
