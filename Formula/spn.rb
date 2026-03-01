# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - Package manager for AI workflows"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.5.0"
  license "MIT"

  # Required dependency
  depends_on "supernovae-st/tap/nika"

  # NovaNet is optional - spn works without it but `spn nv` commands won't work
  # To install: brew install supernovae-st/tap/novanet (requires building from source)

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.5.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "1599c7b1ee2f267acc2adc3373dfd9ee2d0fac3ff7b0b44178e19cdb8432e54f"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.4.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "886063810db90dd6abd6f59aacf7d0f6c3cc540774a5aa5bb8f975be11e5ea7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.4.0/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d0e1a45404c6a3f00deac7ee295b783be910f47d62bc21330bae4df6598dd9d6"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.4.0/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b444193d73b2d6afefa7c7e383cd9d167cf5cbd6a1979caf32cf5df198f001a"
    end
  end

  def install
    bin.install "spn"
  end

  def caveats
    <<~EOS
      NovaNet CLI is optional but recommended for full functionality.
      Without it, `spn nv` commands will not work.

      To install NovaNet (requires Rust):
        cargo install --git https://github.com/supernovae-st/novanet.git
    EOS
  end

  test do
    # Test spn itself
    assert_match "spn", shell_output("#{bin}/spn --version")

    # Test that nika is available
    assert_match "nika", shell_output("nika --version")
  end
end
