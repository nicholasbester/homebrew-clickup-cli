class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.12.1"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.12.1/clickup-macos-arm64.tar.gz"
      sha256 "03b676cac29b1f71ac14cdca6589db9839e1c487c42b12e2d9c832174ab65e68"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.12.1/clickup-macos-x86_64.tar.gz"
      sha256 "5b2c89cc144e97e89832ae8585f57716c84aa46aff1ba8252e18f312877172c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.12.1/clickup-linux-arm64.tar.gz"
      sha256 "e31a3f82b1a34fbcd83fbdc2a4b90a3e20f78a352f49ce04eb41f50bd9f37237"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.12.1/clickup-linux-x86_64.tar.gz"
      sha256 "11024d5330f596defd8dc00cd2e70eff10b2750d7c657f42a2376ab11b2460bc"
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
