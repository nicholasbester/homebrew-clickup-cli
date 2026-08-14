class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.15.5"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.5/clickup-macos-arm64.tar.gz"
      sha256 "07b84806f52ceb4dfda5b7abfbfecd6f5b44a0fbb9a5a6614dd64842b906e46e"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.5/clickup-macos-x86_64.tar.gz"
      sha256 "72a1b5c8e5902b8770f23fc310aa7c11934a7027d9a020d89d2fa317a2699fb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.5/clickup-linux-arm64.tar.gz"
      sha256 "40ccea627c9fac007a35b9bfd5c55f966ee4dc9138af72856103a96bf24efcb2"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.15.5/clickup-linux-x86_64.tar.gz"
      sha256 "09f9c7174d052f6755f00426d0f8494b30824e19d04bfdc4656fa9f65feba9a0"
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
