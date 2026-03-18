# Formula/nika.rb
# v0.30.7: DAG Art + Telemetry — double-line DAG viz, canonical emojis, trace links
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.30.7"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.7/nika-macos-arm64-0.30.7.tar.gz"
      sha256 "1459699e74c320c61b8bbc26a40d5a4a8bf6654d2290f5469ee49e208ca44902"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.7/nika-macos-x64-0.30.7.tar.gz"
      sha256 "1212226af406baa95684c5708690b906d1a010e1c99a74fc55880a5503578ef9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.7/nika-linux-arm64-0.30.7.tar.gz"
      sha256 "d1f46e73f9e3ce9867d6405f682660ec247b721cdae357dbf7ee10cda5b465a5"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.7/nika-linux-x64-0.30.7.tar.gz"
      sha256 "a45957f38da6a827fb5bdaa9752caeea375e84475104d1786b28a291a4472984"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika 0.30", shell_output("#{bin}/nika --version")
  end
end
