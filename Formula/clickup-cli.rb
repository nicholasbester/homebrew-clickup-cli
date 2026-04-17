class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.7.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.7.0/clickup-macos-arm64.tar.gz"
      sha256 "152bd027f076fff3f496e30abf81fa33f5684c14492e8de8ad0af4a8b4f2faed"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.7.0/clickup-macos-x86_64.tar.gz"
      sha256 "d3d330a7012ebe7e8fb19c1f8ea5dae47d9096f357ead6f006efefbf006cd0c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.7.0/clickup-linux-arm64.tar.gz"
      sha256 "35a25ae8def143ff422dde634b48c548a4e5a7a11516c596189f1fa56c11807b"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.7.0/clickup-linux-x86_64.tar.gz"
      sha256 "0e82dc70e73f1c0d35041a09ff28758bc929052d013b07585031874c927debad"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
