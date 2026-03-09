# Formula/spn.rb
class Spn < Formula
  desc "SuperNovae CLI - The Agentic AI Toolkit"
  homepage "https://github.com/supernovae-st/supernovae-cli"
  version "0.15.4"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.4/spn-aarch64-apple-darwin.tar.gz"
      sha256 "6603f53d856883a26947a6f7a294533ef0dbd1911afa3394eaad4e0d18ea1b60"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.4/spn-x86_64-apple-darwin.tar.gz"
      sha256 "5b16984529851926ef23b4146af862e2f2c96031ad9a4c4c9fea80badf2212c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.4/spn-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c5ae218c26b71fa9e95d9649159a5704e0d81cdc892fcbb8d0efff60004687f"
    end
    on_intel do
      url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.15.4/spn-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db8b13e0675cd165d7596c11e178322917f82c0cce99514b61c867b3fcf8187d"
    end
  end

  def install
    bin.install "spn"
  end

  test do
    assert_match "spn", shell_output("#{bin}/spn --version")
  end
end
