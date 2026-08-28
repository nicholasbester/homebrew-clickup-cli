class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.17.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.17.0/clickup-macos-arm64.tar.gz"
      sha256 "ae8d69fa233d3fb226d932e5d74fb7da62b63651eae755cf82a8ba1b970163b2"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.17.0/clickup-macos-x86_64.tar.gz"
      sha256 "1192c5bc3797ea45537d00621dc5f4577c529fb4771feef2a7c2127c475f8081"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.17.0/clickup-linux-arm64.tar.gz"
      sha256 "0404de4969d4535767dd0560811fb1fe6cc20c660c0269fdbe3768fdf563e418"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.17.0/clickup-linux-x86_64.tar.gz"
      sha256 "21ded3ce29e608e5d413ca7d0634dfc65ce415500a9e4d214ced4832d04de0d1"
    end
  end

  def install
    bin.install "clickup-cli", "clkup"
    generate_completions_from_executable(bin/"clickup-cli", "completions")
  end

  test do
    assert_match "clickup-cli #{version}", shell_output("#{bin}/clickup-cli --version")
    assert_match "clickup-cli #{version}", shell_output("#{bin}/clkup --version")
  end
end
