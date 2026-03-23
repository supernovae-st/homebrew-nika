# Formula/nika.rb
# v0.40.2: Coherence audit — AI Integration Suite, GPT-4.1 cost, telemetry events
# Features: TUI, keychain, media pipeline, LSP (Language Server Protocol)
class Nika < Formula
  desc "Semantic YAML workflow engine for AI — 5 verbs, 8 providers, 10 workspace crates, LSP"
  homepage "https://github.com/supernovae-st/nika"
  url "https://github.com/supernovae-st/nika/archive/refs/tags/v0.40.2.tar.gz"
  sha256 "f541f083902ca57194128875e97ad4462ac5ad442b4181c5985d09d4941e8228"
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
    assert_match "nika 0.40", shell_output("#{bin}/nika --version")

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
