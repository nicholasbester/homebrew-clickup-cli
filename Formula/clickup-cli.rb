class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.8.2"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.8.2/clickup-macos-arm64.tar.gz"
      sha256 "ecaf5bbc723bbc4a499d2967ed810a89d99e599dd1e1aa7762479df5254f96af"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.8.2/clickup-macos-x86_64.tar.gz"
      sha256 "ca0915cd67e09e2d046e13756b3c3eaa7bd488080465299013b44308417571bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.8.2/clickup-linux-arm64.tar.gz"
      sha256 "24249db2d473e7ab98d88c7d5f207f727d8bae35b407191eefff930b667365fe"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.8.2/clickup-linux-x86_64.tar.gz"
      sha256 "3297cd3d2bd4da72c37bc96286d4dc9331cbc8d27a787940776f135b0b71f44e"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
