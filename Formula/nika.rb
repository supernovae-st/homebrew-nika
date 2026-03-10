# Formula/nika.rb
# v0.23.0: Comprehensive Audit Release
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.23.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.23.0/nika-macos-arm64-0.23.0.tar.gz"
      sha256 "efd29d25e622f8a1826e2f51351e20b7ecd4de19f5924b1ae03a1614baa808e1"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.23.0/nika-macos-x64-0.23.0.tar.gz"
      sha256 "bf84047a1d50f3499193e12b8e45dc8e1f13624769dda134b9d5562e97f8b70e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.23.0/nika-linux-arm64-0.23.0.tar.gz"
      sha256 "163a1343eca50d8e16dfb7008759a93a182b41aef13b755f0142a078c0fdca57"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.23.0/nika-linux-x64-0.23.0.tar.gz"
      sha256 "2c8a8ac3a457b72852e84b6b48e70d3b5a7fa4c97f71fcb647455bcd0159e7d5"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
