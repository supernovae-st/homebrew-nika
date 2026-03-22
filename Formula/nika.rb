# Formula/nika.rb
# v0.38.0: Cargo workspace split — 10 crates (nika-core, nika-runtime, nika-ast, nika-dag, nika-binding, nika-mcp, nika-provider, nika-tui, nika-lsp, nika)
# Features: TUI, keychain, media pipeline, LSP (Language Server Protocol)
class Nika < Formula
  desc "Semantic YAML workflow engine for AI — 5 verbs, 8 providers, 10 workspace crates, LSP"
  homepage "https://github.com/supernovae-st/nika"
  url "https://github.com/supernovae-st/nika/archive/refs/tags/v0.38.0.tar.gz"
  sha256 "e0af7b7cfd7482715dd240cbe55d607623ae6e7faa065e10362d21f1a5c73136"
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
    assert_match "nika 0.38", shell_output("#{bin}/nika --version")

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
