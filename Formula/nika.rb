# Formula/nika.rb
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.16.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.0/nika-macos-arm64-0.16.0.tar.gz"
      sha256 "079320cb42544556f5d92fd9c16a0475726c6da72aff4e49ec5292bd445b6d35"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.0/nika-macos-x64-0.16.0.tar.gz"
      sha256 "1a52476bfb521990e03826a5d232ed36b049f9f8b074194da62c7363cd7a5fe4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.0/nika-linux-arm64-0.16.0.tar.gz"
      sha256 "d036061935bbd93895d1e74f932e05cc904e295518a1812b3761fed856cd43ba"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.0/nika-linux-x64-0.16.0.tar.gz"
      sha256 "04f1b20b8778f98fed64fe8bbcaa3ffd711230dd6b16f15e5f363ccd077ab21d"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
