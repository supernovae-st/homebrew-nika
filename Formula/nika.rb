# Formula/nika.rb
# v0.30.3: A+++ Quality Pass — CRLF compliance, NaN fixes, 34 property tests
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.30.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.3/nika-macos-arm64-0.30.3.tar.gz"
      sha256 "e8192cd02829e8cfa516ecfc790a3a5debb51dd355cd067388c7755b6e4de23b"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.3/nika-macos-x64-0.30.3.tar.gz"
      sha256 "cbe9a954b2015f442a83249e48dffea5c9460ed158768279bd1d14dd4447544c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.3/nika-linux-arm64-0.30.3.tar.gz"
      sha256 "002ebbad2e3f01daa950dff96cd02aa62e46a4711819c452363d8941e1cdff09"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.3/nika-linux-x64-0.30.3.tar.gz"
      sha256 "6db7146d40c5ab1055b59cded5045ac21e84fff2e540bd5d5ec2c7e05d4e14b4"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
