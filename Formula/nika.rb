# Formula/nika.rb
# v0.27.0: spn→nika Feature Fusion + Native Inference
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.27.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.27.0/nika-macos-arm64-0.27.0.tar.gz"
      sha256 "dd516b97a4ed62a937668d0187b621a92c980b2b7bd11b0b6ee2ba505e0faef8"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.27.0/nika-macos-x64-0.27.0.tar.gz"
      sha256 "aea3475860824d4cab9a3788670d2ba77fc82a3c3a8115dc550d9053314db104"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.27.0/nika-linux-arm64-0.27.0.tar.gz"
      sha256 "20be3331112d8981db12c6e444bee766aa0c9beeac2e9ce9b934718ddcc28408"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.27.0/nika-linux-x64-0.27.0.tar.gz"
      sha256 "73b94192fb264ef587eec920a436aa18aff1b04b94d03db31b267da5f9f2dafa"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
