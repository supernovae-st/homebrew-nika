# Formula/nika.rb
# v0.35.3: Fortress of Solitude — 49 bug fixes, pipe transforms, 6735+ tests
class Nika < Formula
  desc "Semantic YAML workflow engine for AI — 5 verbs, 8 providers, 26 tools"
  homepage "https://github.com/supernovae-st/nika"
  url "https://github.com/supernovae-st/nika/archive/refs/tags/v0.35.3.tar.gz"
  sha256 "c8ad2f1072bd47dda1dbf2d5eaf185f6f60790f8dab9ba3e539359771f80825d"
  license "AGPL-3.0-or-later"
  head "https://github.com/supernovae-st/nika.git", branch: "main"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  def install
    cd "tools/nika" do
      system "cargo", "install", "--no-default-features",
             "--features", "tui,native-keychain,media-core",
             "--path", ".", "--root", prefix
    end
  end

  test do
    assert_match "nika 0.35", shell_output("#{bin}/nika --version")

    # Verify check command works
    (testpath/"test.nika.yaml").write <<~YAML
      schema: "@0.12"
      description: "Homebrew test"
      tasks:
        - id: hello
          exec: "echo hello"
    YAML
    assert_match "DAG", shell_output("#{bin}/nika check #{testpath}/test.nika.yaml")
  end
end
