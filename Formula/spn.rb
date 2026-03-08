# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - The Agentic AI Toolkit"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.15.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.0/spn-aarch64-apple-darwin.tar.gz"
      sha256 "08a8f1a985a58db880ef35e317b1fcb312c68546b10d7fb1ac775616a066374f"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "085c369542af7acb60b702c355e33f897a2ebf0c06620422369483050149498f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.0/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb68b5afd0d8a192353f842a44e19093418d099527bd760ffabf7875e50d836c"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.0/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "daa2174c87c780badc51256d28810b1e7bfa488ca833cf31c64084cd4edbfd97"
    end
  end

  def install
    bin.install "spn"
  end

  test do
    assert_match "spn", shell_output("#{bin}/spn --version")
  end
end
