class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.1/clickup-macos-arm64.tar.gz"
      sha256 "5d0fb8afeced48a417cc87158befc4eec60e8941bf95e598c6f05cc097f09d02"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.1/clickup-macos-x86_64.tar.gz"
      sha256 "8e02feb5a9b208a970f005538f90a7684ca7b117517c14c46b71fbdea5447756"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.1/clickup-linux-arm64.tar.gz"
      sha256 "2e7b73cd0fcd13ea63f7db9fd1dc50b991d47af6e2ef81170cad0314c508c0c5"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.1/clickup-linux-x86_64.tar.gz"
      sha256 "c1118619508432f2cfd9a1a02f438f0c4a3667fe688f4ddb7204cb7443b46636"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
