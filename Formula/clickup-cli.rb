class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.14.0"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.14.0/clickup-macos-arm64.tar.gz"
      sha256 "8cb20ba9183ed23c8734dcc95b8f54c731e8c2c600ab6532a7c3fbc6c8257ac3"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.14.0/clickup-macos-x86_64.tar.gz"
      sha256 "ee5ae95308c806d9ee006c1a47eb06e84f980fac0a5441b42fb156c890af2f0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.14.0/clickup-linux-arm64.tar.gz"
      sha256 "1e475c1176197dac4164118051c76087a58a03cd2817a1d232ccf86f4c6ed910"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.14.0/clickup-linux-x86_64.tar.gz"
      sha256 "82c0c06c25162f24a977da2415c1bb09be717eaa9a70c86f58b31195a58ebb69"
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
