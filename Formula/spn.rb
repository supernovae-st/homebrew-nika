# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - Package manager for AI workflows"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.12.4"
  license "MIT"

  # Required dependency
  depends_on "supernovae-st/tap/nika"

  # NovaNet is optional - spn works without it but `spn nv` commands won't work
  # To install: brew install supernovae-st/tap/novanet (requires building from source)

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.12.4/spn-aarch64-apple-darwin.tar.gz"
      sha256 "bd8f83a4f8c30e336a60d76d893bf24bbaf4736a1e43c58392ffd3648550d8f0"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.12.4/spn-x86_64-apple-darwin.tar.gz"
      sha256 "3472d55b53eb3fb8d9c1b14653c31540d74b6501b461d437e926e9eb95af8013"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.12.4/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29c8160b8ccaa4e0159076f98db0f7d7c03e1fa87f3348a762414bb15bdb058c"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.12.4/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "553d726ca553f4d895ad295d20c1a801f3c70548ae9560ef561eaea00252a7ff"
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
