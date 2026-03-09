# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - The Agentic AI Toolkit"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.15.5"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.5/spn-aarch64-apple-darwin.tar.gz"
      sha256 "36a0621968dff9b7afea8d645b0d727a69a2d1e635d3fad5dfc96008ab395cb0"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.5/spn-x86_64-apple-darwin.tar.gz"
      sha256 "12847ba9c04b1847ee8bedf6efa5b371a0e082bcc702cca5179021ff0fe3ab13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.5/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f0950b701a006f95fe1b4c597875edd68d1ea45a2a37b68c54fd0c842d91edf"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.5/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "029dae828f26f526b370428ce8a83a4d0a443a70c3a265e91bf52e69d9e6dff7"
    end
  end

  def install
    bin.install "spn"
  end

  test do
    assert_match "spn", shell_output("#{bin}/spn --version")
  end
end
