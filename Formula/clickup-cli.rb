class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.6.7"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.7/clickup-macos-arm64.tar.gz"
      sha256 "6202b93eae082db51c44768dc3eeaaf4bf2fa33536094abaff91a0863636a041"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.7/clickup-macos-x86_64.tar.gz"
      sha256 "5c9bc2dd5cd032e4a5875c64b8c0e3bc056e59a35d6c6009ad18bff289b9805e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.7/clickup-linux-arm64.tar.gz"
      sha256 "9721e90f7810bf12d4f3ddd4e2de9122584a081a9a3222e0849835d3ad5d95fe"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.7/clickup-linux-x86_64.tar.gz"
      sha256 "eb8145b573ababc04ee304475afe07035c6ee7ebc0250fc60b6bc67950bc0b39"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
