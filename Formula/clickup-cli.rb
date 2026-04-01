class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.6.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.2/clickup-macos-arm64.tar.gz"
      sha256 "102ed4661b872ea094061a3980218e16a9a5d51a22e89e408cb26b2c0d513310"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.2/clickup-macos-x86_64.tar.gz"
      sha256 "83936bee6234d33329d0ff5af631a21a4bf0e77fce57b640aa10ddb1d952d170"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.2/clickup-linux-arm64.tar.gz"
      sha256 "33218df14ca698e1b0033811b9e7a2a641dc387faaddb88c560afc46d0b17b69"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.2/clickup-linux-x86_64.tar.gz"
      sha256 "1055735cf92dc2e193f1433d083038b84857e277ae35af2c99d5ed90bf619f64"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
