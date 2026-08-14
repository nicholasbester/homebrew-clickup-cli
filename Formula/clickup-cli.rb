class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.15.3"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.3/clickup-macos-arm64.tar.gz"
      sha256 "09648559a2f3da52710ba048154f01b57178831299ecc79a9be47b7b3ae740e8"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.3/clickup-macos-x86_64.tar.gz"
      sha256 "a32ebb1c4c9ccc0a18045de0c7efa3b999aec3325095c9e53bfa8ae20c8a62be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.3/clickup-linux-arm64.tar.gz"
      sha256 "5ac59117637d44062695163840044d5217bf8abd94bcb7d1251117a5b0472c2f"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.3/clickup-linux-x86_64.tar.gz"
      sha256 "2e36679513b7a45e2fe032fc7b82b148c148d34b8ea2bbda2fcb446d2681077b"
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
