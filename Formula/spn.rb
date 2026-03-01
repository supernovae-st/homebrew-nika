# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - Package manager for AI workflows"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.3.0"
  license "MIT"

  # Dependencies - installing spn installs these too
  depends_on "supernovae-st/tap/nika"
  depends_on "supernovae-st/tap/novanet"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.3.0/spn-aarch64-apple-darwin.tar.gz"
      sha256 "b662f0f550782b5873053a4ea6711275996033f0c9f461b8b64b0449d18ebac4"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.3.0/spn-x86_64-apple-darwin.tar.gz"
      sha256 "7bf2eb179c3efb92a28d7c9e222a3314171a19f17617f67a93810b716b84dea8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.3.0/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e51d5a0d14c4e0a31c75873fba92cd68df323282ef27530dedcb759c5c7ca5e"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.3.0/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a7812a032ed5a68a4d5dd439fb5b232662ab1073ef260f9194ee5903a8cf5b93"
    end
  end

  def install
    bin.install "spn"
  end

  test do
    # Test spn itself
    assert_match "spn", shell_output("#{bin}/spn --version")

    # Test that dependencies are available
    assert_match "nika", shell_output("nika --version")
    assert_match "novanet", shell_output("novanet --version")
  end
end
