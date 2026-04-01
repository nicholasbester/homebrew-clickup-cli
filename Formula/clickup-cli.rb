class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.6.5"
  license "BUSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.5/clickup-macos-arm64.tar.gz"
      sha256 "469746e5599af8bb69dbf361b0ae184ef5590e5fd5c769ce709cfb31335a9b03"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.5/clickup-macos-x86_64.tar.gz"
      sha256 "d48ef061b571a03d676dacd41679e679343e150a259dd1e350e0f3d60f2ce077"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.5/clickup-linux-arm64.tar.gz"
      sha256 "2ce6e83504fbc25bcbcbbc6bf48dc4ba163488149ad665bf8b4dbc04e5bf2d00"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.6.5/clickup-linux-x86_64.tar.gz"
      sha256 "dd59d30b3b693bd8106cba5ff5efd124c92fb9e25910d8ea5f9b87d8d1977538"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
