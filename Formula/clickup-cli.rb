class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.9.1"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.9.1/clickup-macos-arm64.tar.gz"
      sha256 "4a3ea4b8fa94c4bd64e685a246fc96fc9ad22326e70165421af9c2f5c830e176"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.9.1/clickup-macos-x86_64.tar.gz"
      sha256 "27d1823d43a8aa0dc3dcfec25b14ecfaebe4669aa0dafc3fcbfbb2858c00394b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.9.1/clickup-linux-arm64.tar.gz"
      sha256 "33ad78d6115f8ddbef4cd76a51bb687ba63ca4a12ff00f404587e5672b260ae3"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.9.1/clickup-linux-x86_64.tar.gz"
      sha256 "06903d9880bdec2d9a9a682915da124554273d70cea131ed2e60c772937f3117"
    end
  end

  def install
    bin.install "clickup"
    generate_completions_from_executable(bin/"clickup", "completions")
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
