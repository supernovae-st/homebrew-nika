# Formula/nika.rb
# v0.39.1: Quick wins + course improvements — watch mode, 3-star scoring, nika showcase
# Features: TUI, keychain, media pipeline, LSP (Language Server Protocol)
class Nika < Formula
  desc "Semantic YAML workflow engine for AI — 5 verbs, 8 providers, 10 workspace crates, LSP"
  homepage "https://github.com/supernovae-st/nika"
  url "https://github.com/supernovae-st/nika/archive/refs/tags/v0.39.1.tar.gz"
  sha256 "c1da17c60c4f54618b6530bb2620623ddd0b90bae5c2ca6b3bc9a44b9d1b649f"
  license "AGPL-3.0-or-later"
  head "https://github.com/supernovae-st/nika.git", branch: "main"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  def install
    cd "tools" do
      system "cargo", "install", "--path", "nika",
             "--features", "tui,nika-daemon,media-core,lsp",
             "--root", prefix
    end
  end

  test do
    assert_match "nika 0.39", shell_output("#{bin}/nika --version")

    (testpath/"test.nika.yaml").write <<~YAML
      schema: "nika/workflow@0.12"
      description: "Homebrew test"
      tasks:
        - id: hello
          exec: "echo hello"
    YAML
    assert_match "DAG", shell_output("#{bin}/nika check #{testpath}/test.nika.yaml")
  end
end
