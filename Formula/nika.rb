# Formula/nika.rb
# v0.30.6: Nuclear Purge + CLI UX — DAG visualization, canonical emojis
class Nika < Formula
  desc "Semantic YAML workflow engine for AI"
  homepage "https://github.com/supernovae-st/nika"
  version "0.30.6"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.6/nika-macos-arm64-0.30.6.tar.gz"
      sha256 "1845ef4f23dade150f79c0862b2d3f35a0482d9957fd2d07f8298edd69e71048"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.6/nika-macos-x64-0.30.6.tar.gz"
      sha256 "38cc3daf65c16fd08a95160702460f9b4cb54a9b3994317d95d111ec71e241da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.6/nika-linux-arm64-0.30.6.tar.gz"
      sha256 "cd031ce1f426dbda7050e3dfa8a35774369b64d53d1543cfe2e6a482a8a47377"
    end
    on_intel do
      url "https://github.com/supernovae-st/nika/releases/download/v0.30.6/nika-linux-x64-0.30.6.tar.gz"
      sha256 "cbebe346c8aa35089eb0bd2af682a26c1d35eb4f50d2f815e13ca5e396700b15"
    end
  end

  def install
    bin.install "nika"
  end

  test do
    assert_match "nika", shell_output("#{bin}/nika --version")
  end
end
