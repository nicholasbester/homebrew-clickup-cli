class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.5.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.2/clickup-macos-arm64.tar.gz"
      sha256 "a097144c2dc9b67b51bb3945f27589b57389ac5e9d87f481e4e19071a895d3f0"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.2/clickup-macos-x86_64.tar.gz"
      sha256 "1309309b35d6efe53db6ce3ff1d7864b4ee77e1aebf4732cbc825ce9ebdaaf6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.2/clickup-linux-arm64.tar.gz"
      sha256 "fe69d3d760a7c3af3f3eac0d43831dff17130846e31e85b4e3bc465cef3183c9"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.2/clickup-linux-x86_64.tar.gz"
      sha256 "e895c5bb7164961ea9930824b0f3fb853238defbec8638aa98018046a7de6098"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
