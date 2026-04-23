class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.9.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.9.0/clickup-macos-arm64.tar.gz"
      sha256 "539e7e61cbd08f6fdd9a9dd27c04e3e7cd0d5247fcd46f3bcc45e0fb1ee55adb"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.9.0/clickup-macos-x86_64.tar.gz"
      sha256 "72b9a65957dd56efc77a77cc395a70fdb8e46ec79cd9a9a81cf152d850dd144c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.9.0/clickup-linux-arm64.tar.gz"
      sha256 "215a1133c03ab36f6b30f0a3a1e81225a263e5214b58178a7bbc8df3078fc6b0"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.9.0/clickup-linux-x86_64.tar.gz"
      sha256 "91a8d36c259a611e24619a48f3698ad7bb2c162e77d517528d94de87d19aed59"
    end
  end

  def install
    bin.install "clickup"
    generate_completions_from_executable(bin/"clickup", "completions")
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
