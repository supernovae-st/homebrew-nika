# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - The Agentic AI Toolkit"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.15.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.2/spn-aarch64-apple-darwin.tar.gz"
      sha256 "d955011a1936b53bda12d70933d3df5636473e6c201ca3ff7229a4c797099e57"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.2/spn-x86_64-apple-darwin.tar.gz"
      sha256 "536e52a00763d0b9cb092c20ee78e93046e38afa6caf16067f6ed6a3e1b26389"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.2/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8dcd5f8b3db292b86c3314aff39a802006fb2b540aa8cbdc36fca73414325393"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.2/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9bba45d13db58fe12ea6f4ac5165e68dcaa87b4769b380f6e0ec82268769e1c"
    end
  end

  def install
    bin.install "spn"
  end

  test do
    assert_match "spn", shell_output("#{bin}/spn --version")
  end
end
