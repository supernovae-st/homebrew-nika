# Formula/nika.rb
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.16.5"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.5/nika-macos-arm64-0.16.5.tar.gz"
      sha256 "550350546a3e5b00148b9065ed2b3eda260ff63e84440edf0aae8db7aff8fc6b"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.5/nika-macos-x64-0.16.5.tar.gz"
      sha256 "d85baceb8eb912846a5b9d292af2e23e758956b915d9c6cb2c28dd688fec92fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.5/nika-linux-arm64-0.16.5.tar.gz"
      sha256 "0fcbf61e97598826b374bc66a5a2f13df28658086ab2635a7c48f57b0efde4c2"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.16.5/nika-linux-x64-0.16.5.tar.gz"
      sha256 "d80dfa28c1e8c6c2b23b6545ea01ef093140182b42a029bbba34a9937ba24eb1"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
