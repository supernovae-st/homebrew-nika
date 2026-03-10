# Formula/nika.rb
# v0.24.0: Comprehensive Bug Fix Release
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.24.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.24.0/nika-macos-arm64-0.24.0.tar.gz"
      sha256 "b127b2564c62f27248b321558ffea1eadb646276d0a91eafba2aecfff83f0d56"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.24.0/nika-macos-x64-0.24.0.tar.gz"
      sha256 "45e1062a5ed78f0822ecfb1b7795e8698db2920145917c2aa13511ef05204110"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.24.0/nika-linux-arm64-0.24.0.tar.gz"
      sha256 "18e4d604b9686c6b17b4201e064e7d2d7bce53df1d79d0d5d8a35bb547b7ed73"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.24.0/nika-linux-x64-0.24.0.tar.gz"
      sha256 "07b323068ee4fb21891530c0456f0505be694c426e5fb6a589822c29e7e2df89"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
