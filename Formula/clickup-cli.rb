class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.5.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.2/clickup-macos-arm64.tar.gz"
      sha256 "f8099bd0b05d88e7cffe302d5146308ad02b1a910c158a7af754144a1b90b3e5"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.2/clickup-macos-x86_64.tar.gz"
      sha256 "dd0138680bdbd59c55b4aac24bcb05421c2d8d758f88dfb0f4cb37ce034bd185"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.2/clickup-linux-arm64.tar.gz"
      sha256 "eb544aa41601fab27b2b44f23bdefc7a30cddd66cf005d21a9da97d08de8b4ed"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.2/clickup-linux-x86_64.tar.gz"
      sha256 "3d29f037039c842e2441dfab3581ff7cfb0bf5ff8c9013a4174c94a094152045"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
