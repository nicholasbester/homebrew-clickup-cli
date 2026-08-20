class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.16.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.16.0/clickup-macos-arm64.tar.gz"
      sha256 "8f18944cdbb6db5523db78b6936a5a5369e18f7fadcfd06e9bd7e837da431402"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.16.0/clickup-macos-x86_64.tar.gz"
      sha256 "9aaa0fb19f264c2e1ac63fa71ad8a02fd28a4ecaa11f40f5a6b54c912dc76146"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.16.0/clickup-linux-arm64.tar.gz"
      sha256 "ff22e83dd67789f93e0569b8f9b4ce0fb8e73f6349604dc3fefa016739685114"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.16.0/clickup-linux-x86_64.tar.gz"
      sha256 "53fcbd659a977bef64d66dcee282bf0ecdf6033464b1499507a9cfac8f102f28"
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
