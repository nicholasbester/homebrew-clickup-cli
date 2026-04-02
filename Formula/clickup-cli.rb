class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.6.6"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.6/clickup-macos-arm64.tar.gz"
      sha256 "10fa29db29932d9aae0ea12d53b1899091026778ebe388f1a0d284d5c4b7afbc"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.6/clickup-macos-x86_64.tar.gz"
      sha256 "caa64bebad6499f36a4c12b8f4c879ec792b76947ed5bdd82fab98e97b17c126"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.6/clickup-linux-arm64.tar.gz"
      sha256 "8a87f7ebb429b4a004c65039900ffabfc6a2c2c5b4f3d57d73a6afa6ef28f5ed"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.6/clickup-linux-x86_64.tar.gz"
      sha256 "af285884f23b024b8f092f284ecbe1c040b8bf76a54533e8a82663af5f41f9f2"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
