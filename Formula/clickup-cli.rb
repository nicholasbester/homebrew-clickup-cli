class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.15.4"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.4/clickup-macos-arm64.tar.gz"
      sha256 "c64a6e2e4b794b53e0805c4bc2b322398da2a7ca6715eb0ae0ddbd97d979a877"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.4/clickup-macos-x86_64.tar.gz"
      sha256 "c86ccb7fb5ff9915db9f3a572c7ae980542c3689ed3972a7369adbbb6f12b926"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.4/clickup-linux-arm64.tar.gz"
      sha256 "67e4989f735a34aa56769300271b485304c5ce6be7731c310582b34be1370ed3"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.4/clickup-linux-x86_64.tar.gz"
      sha256 "1378134d5435a41d49dfe70b7cdd71869ab63fbc02c97e9a69c5f79558a2108c"
    end
  end

  def install
    bin.install "clickup-cli", "clkup"
    generate_completions_from_executable(bin/"clickup-cli", "completions")
  end

  test do
    assert_match "clickup-cli #{version}", shell_output("#{bin}/clickup-cli --version")
    assert_match "clickup-cli #{version}", shell_output("#{bin}/clkup --version")
  end
end
