class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.10.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.10.0/clickup-macos-arm64.tar.gz"
      sha256 "c22806656e55b6d09e2450e0e760699c627a3656ee40b7f695fde7c45021c43e"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.10.0/clickup-macos-x86_64.tar.gz"
      sha256 "d600a5e881c41be2f1dfa6eef97da9f553bf3c8931e0a7df03d83d62a6e9857a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.10.0/clickup-linux-arm64.tar.gz"
      sha256 "026223f8df10cf363ccada7540bbbe0678b07789d4c8d9004112dda6d75d24b3"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.10.0/clickup-linux-x86_64.tar.gz"
      sha256 "ab536601ebcf7e801fa243e76d542e9b38533de32e40e31975b9ed16fc87f1b1"
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
