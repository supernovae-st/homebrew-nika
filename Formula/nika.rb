# Formula/nika.rb
# v0.23.1: Provider Definitions Fix
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.23.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.23.1/nika-macos-arm64-0.23.1.tar.gz"
      sha256 "6997a1f00a40d883ebf3c2648f083fbfd58e54fbed3bcf6a1ded2f8fc10c33bb"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.23.1/nika-macos-x64-0.23.1.tar.gz"
      sha256 "6a4aaf50fc73b7c1b58d0d2e452fcf9e4eff481214994f01a8eeb9123d4d4571"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.23.1/nika-linux-arm64-0.23.1.tar.gz"
      sha256 "0000cb487db9f7128af31a598466629fbc0fb5210d4c0a628480a1417357fb73"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.23.1/nika-linux-x64-0.23.1.tar.gz"
      sha256 "9f77face4d4f397e108e7a75684d784988e9b5eb214bf8d03732f58665e36343"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
