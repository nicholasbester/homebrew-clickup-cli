class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.0/clickup-macos-arm64.tar.gz"
      sha256 "3e072e01112f1a19e72074f286c22876ca65b2b34062156febcc4b31a7097c67"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.0/clickup-macos-x86_64.tar.gz"
      sha256 "4ec3416f1879d46596713802806205f1a35b7ded615e945b95e94855476130d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.0/clickup-linux-arm64.tar.gz"
      sha256 "c5b73defb8518e4d38406a784409afd0b15c312f838492907fb457e7aacf8d40"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.0/clickup-linux-x86_64.tar.gz"
      sha256 "84572318c21cdd174320f54c330a8f4ba077a6a3ab064981b9dc4f3c2cd47a6e"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
