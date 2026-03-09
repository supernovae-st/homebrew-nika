# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - The Agentic AI Toolkit"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.15.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.3/spn-aarch64-apple-darwin.tar.gz"
      sha256 "7a487f6b5d9e9d7431507948ac7a3e2ea3735cc1b9728f5dc862da90ce1cd0d0"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.3/spn-x86_64-apple-darwin.tar.gz"
      sha256 "f81b50461368559b73f27e6e339fc322e72aa7c80fdcab5dd9853c3941c4c13c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.3/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dcd1aee51f7993a2c364c4861c98f9860109fb988df215e67a3174069e6c715e"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.3/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "67bdc81735174be7a08902dc9ce227eb7fa7d21dfd2d33e71fda600e8168bead"
    end
  end

  def install
    bin.install "spn"
  end

  test do
    assert_match "spn", shell_output("#{bin}/spn --version")
  end
end
