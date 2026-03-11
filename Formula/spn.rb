# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - The Agentic AI Toolkit"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.17.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.17.0/spn-aarch64-apple-darwin.tar.gz"
      sha256 "7943e766eec20fd72cac17c06db5ca3b45deba5a6424d0f40322c38080708033"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.17.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "9e4aaa2dfa98416b519d1d5be20af64e3e5a1ba53be8cb8a0ea0266b1543dac0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.17.0/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f503c64e20e16fd8b4360ab7bc8883eb24a46f1d946ba01d226d5b8ed345138e"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.17.0/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a360951cd8e85b138a1edb77c8a94ab9af6b4b44982950b9cceef6f8124731cc"
    end
  end

  def install
    bin.install "spn"
  end

  test do
    assert_match "spn", shell_output("#{bin}/spn --version")
  end
end
