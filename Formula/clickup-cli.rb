class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.8.1"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.8.1/clickup-macos-arm64.tar.gz"
      sha256 "854d6e2cfeef3707c53209769e6caf03d07d79f66cb8cdf4ec4b0ae59aebbb21"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.8.1/clickup-macos-x86_64.tar.gz"
      sha256 "baad5fd7ef6fd7596e63d006555e9f5f4f58ca6b2e6ea53ea89727bf09f635ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.8.1/clickup-linux-arm64.tar.gz"
      sha256 "e9ea85f62f0f028ec551112451ce37c3a76525a7d0617f70dd57ab572036d00c"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.8.1/clickup-linux-x86_64.tar.gz"
      sha256 "054a9d4ab6c20e908a1f381205148e65bd0fea8d75d1dd4c0935996bbf288b84"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
