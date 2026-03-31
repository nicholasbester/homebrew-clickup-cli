class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.1/clickup-macos-arm64.tar.gz"
      sha256 "9772324b326a5dbd18e86000296cbd563a7898b4a44df8194c5f0fee44b7d27c"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.1/clickup-macos-x86_64.tar.gz"
      sha256 "e74c5d4ce25c45b0728f97d4b89774cce0f262f081420df294ed29c9502709b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.1/clickup-linux-arm64.tar.gz"
      sha256 "628aedc90e707b27c0a223c15c7f6b457574207ee04489fe3f5d566216bbad34"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.1/clickup-linux-x86_64.tar.gz"
      sha256 "ce3f9b3584d5932f6df51eba0327d9026c70dd301827d5fb8ec8c3380880a31d"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
