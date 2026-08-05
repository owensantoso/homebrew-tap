class AutoAirdropCli < Formula
  desc "AirDrop files to a named device without manual clicks"
  homepage "https://github.com/owensantoso/auto-airdrop-cli"
  url "https://github.com/owensantoso/auto-airdrop-cli/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "c9e8b6178316889c859497029845bcadece3e495ba5030ed79f397d0301613df"
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
