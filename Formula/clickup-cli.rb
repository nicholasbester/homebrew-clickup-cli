class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.5.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.3/clickup-macos-arm64.tar.gz"
      sha256 "f3925d44942bc69a360f8911261831da8e72b1df3bfcd0a200046ff9859e69ca"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.3/clickup-macos-x86_64.tar.gz"
      sha256 "0e62d0129c1f322c83e85df05159af21edb394069c18f74322e64afe8a0cfee1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.3/clickup-linux-arm64.tar.gz"
      sha256 "a2560bb28f4ff3a445bd6e0a73e9f2ebf9d213707e13285a164089ec86a9c18e"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.3/clickup-linux-x86_64.tar.gz"
      sha256 "f1f2a9f44601c4504e1ebe1584f9896942f797386bd01d57ca0f271d09391c59"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
