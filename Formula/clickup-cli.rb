class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.11.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.11.0/clickup-macos-arm64.tar.gz"
      sha256 "f06eb51295d155de381b02a5353cbfe860f37e5face4cfe80412f57559f50992"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.11.0/clickup-macos-x86_64.tar.gz"
      sha256 "e106601c3addbe43c208b39d5fb98c4024977f28a185436bfc34bfad51349096"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.11.0/clickup-linux-arm64.tar.gz"
      sha256 "89ed4ed8f3ab182bebdb62f13afd9dbb58dc342da46329900b750acfa5c319b9"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.11.0/clickup-linux-x86_64.tar.gz"
      sha256 "2e840e804985a2318fa61f4706b5300f9703abca9d01a53a4e8d9b989e675a9e"
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
