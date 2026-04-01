class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.6.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.3/clickup-macos-arm64.tar.gz"
      sha256 "03f776efc85a6ac92a290709b39b5df006b9be9294b91c45126f3fe07133b4bf"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.3/clickup-macos-x86_64.tar.gz"
      sha256 "9d89049e1f7e099375de2ae301e6b957b48f6d32df4ec26fdf9a5933e83f3e29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.3/clickup-linux-arm64.tar.gz"
      sha256 "3492e40279f241db95cb5f060d64eb7b16da6ae97e1fd272b891915417744a7b"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.3/clickup-linux-x86_64.tar.gz"
      sha256 "ed25c09fdd3be57b3e6daa8ad25a4b6d5d9d6bd327f56790b166c2c221626b52"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
