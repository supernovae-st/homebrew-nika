# Formula/nika.rb
# v0.30.8: Live DAG — in-place ANSI rendering during nika run
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.30.8"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.8/nika-macos-arm64-0.30.8.tar.gz"
      sha256 "d814ada85dcba0a8900c3aa25a001ba168d66e80494e2f15bb6a8707dc5cffe9"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.8/nika-macos-x64-0.30.8.tar.gz"
      sha256 "5c156d8491a25006c8adf3c66fdb07ca7f44c884b3724e5d88a1e75587a2424a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.8/nika-linux-arm64-0.30.8.tar.gz"
      sha256 "fecebc0db2645e3d73a8d759fc160b345a81bbc4e42e6907c181da648b5f01a0"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.8/nika-linux-x64-0.30.8.tar.gz"
      sha256 "5df28e6adccd3b79f49ccc4444d51231f51eb0dfcf4b4269f2fae47902dd0e8a"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika 0.30", shell_output("#{bin}/nika --version")
  end
end
