# Formula/nika.rb
# v0.22.0: Multi-Cursor + Git Gutter + LSP Foundation
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.22.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.22.0/nika-macos-arm64-0.22.0.tar.gz"
      sha256 "5e30a7f8fc35a5ded5bcd7464b75b3ef098a534becc5ab10ff1f122a88a5525f"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.22.0/nika-macos-x64-0.22.0.tar.gz"
      sha256 "4e8156f4f784ca55920ba6a88d009efaabfac26be5422232d3436138f04aa0f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.22.0/nika-linux-arm64-0.22.0.tar.gz"
      sha256 "e5555eabab6794966355620ffe54ff161c2dab0ebcecb5056deccafc4e4c6881"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.22.0/nika-linux-x64-0.22.0.tar.gz"
      sha256 "e97fc1a260124fdddf8ae3d14bc5c91f5e8d7b3694f0d4b01cb032602a3d3f7d"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
