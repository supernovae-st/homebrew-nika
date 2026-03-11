# Formula/nika.rb
# v0.26.0: Native Inference via mistral.rs (ADR-008)
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.26.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.26.0/nika-macos-arm64-0.26.0.tar.gz"
      sha256 "7dc5da8e9ae4cc84eff0f5ad7d56b899a1f4c2c7b183c4fc9d662084041907e7"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.26.0/nika-macos-x64-0.26.0.tar.gz"
      sha256 "1cf0472f6a12d4f93c3bf1c8242169bbfcc5cfe73691195d26f687afdd9cb9a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.26.0/nika-linux-arm64-0.26.0.tar.gz"
      sha256 "07122692bd8a8a5ae2245303ecb45c788578b9ea3fc0c03e32787ea1e4e8328a"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.26.0/nika-linux-x64-0.26.0.tar.gz"
      sha256 "94872adc4ac2a57fbabf83eb2e1ca18a33d9961e5af0773edb353b1ad0edfb07"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
