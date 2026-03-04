# Formula/nika.rb
# v0.20.0: 8-View TUI Architecture + Tree Widget + Two-Phase IR
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.20.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.20.0/nika-macos-arm64.tar.gz"
      # SHA256 will be populated after release workflow completes
      sha256 "PLACEHOLDER_ARM64_MAC"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.20.0/nika-macos-x64.tar.gz"
      # SHA256 will be populated after release workflow completes
      sha256 "PLACEHOLDER_X64_MAC"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.20.0/nika-linux-arm64.tar.gz"
      # SHA256 will be populated after release workflow completes
      sha256 "PLACEHOLDER_ARM64_LINUX"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.20.0/nika-linux-x64.tar.gz"
      # SHA256 will be populated after release workflow completes
      sha256 "PLACEHOLDER_X64_LINUX"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
