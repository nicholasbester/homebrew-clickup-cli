class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.13.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.13.0/clickup-macos-arm64.tar.gz"
      sha256 "e0c2d94cc10e83951d6d6c2eb3a1d815710ec80a191d0ff72584e8592d7121bc"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.13.0/clickup-macos-x86_64.tar.gz"
      sha256 "f72daf7677452c955d758a5a7b689a3c12fb27e54744bbd51f86e95dc4f385ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.13.0/clickup-linux-arm64.tar.gz"
      sha256 "af845031d9437dac5d67a2c416fd28b121ce4bcd4b7a37953b80003c06553555"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.13.0/clickup-linux-x86_64.tar.gz"
      sha256 "658bfa75d33532d19eadadbb9be85dc5c4942f5f25cc2ddad3f53d290f6e22b4"
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
