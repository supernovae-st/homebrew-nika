# Formula/nika.rb
# v0.37.0: Schema @0.12 Only — zero backward compat, stop_sequences, nuclear cleanup
# Features: TUI, media pipeline, LSP, 8 providers, 113 MCP aliases
class Nika < Formula
  desc "Semantic YAML workflow engine for AI — 5 verbs, 8 providers, 43 tools, LSP"
  homepage "https://github.com/supernovae-st/nika"
  url "https://github.com/supernovae-st/nika/archive/refs/tags/v0.37.0.tar.gz"
  license "AGPL-3.0-or-later"
  head "https://github.com/supernovae-st/nika.git", branch: "main"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  def install
    cd "tools/nika" do
      system "cargo", "install", "--no-default-features",
             "--features", "tui,native-keychain,media-core,fetch-extract,fetch-article,fetch-feed,lsp",
             "--path", ".", "--root", prefix
    end
  end

  test do
    assert_match "nika 0.37", shell_output("#{bin}/nika --version")

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
