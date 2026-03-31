class ClickupCli < Formula
  desc "CLI for the ClickUp API, optimized for AI agents"
  homepage "https://github.com/nicholasbester/clickup-cli"
  version "0.5.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.3/clickup-macos-arm64.tar.gz"
      sha256 "158c31a54a5d186451714c7ec899655176e55ca1f2464c145ef990d86c113bb0"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.3/clickup-macos-x86_64.tar.gz"
      sha256 "2bc4245814166fcb91ac1c88c58a4047347fdb42bf9ab35f7365a92fae188611"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.3/clickup-linux-arm64.tar.gz"
      sha256 "5afbcd3497719655abc02aeb8540de4e6bcb46ea97f5e8a2b0fc2348356f9f7a"
    else
      url "https://github.com/nicholasbester/clickup-cli/releases/download/v0.5.3/clickup-linux-x86_64.tar.gz"
      sha256 "5ff57f657ae887c78acf7820dcbea678c7260abf7125048807ecbc43c0f4a751"
    end
  end

  def install
    bin.install "clickup"
  end

  test do
    assert_match "clickup #{version}", shell_output("#{bin}/clickup --version")
  end
end
