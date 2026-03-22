# Formula/nika.rb
# v0.39.0: Interactive course + init redesign — 12 levels, 44 exercises, cliclack wizard
# Features: TUI, keychain, media pipeline, LSP (Language Server Protocol)
class Nika < Formula
  desc "Semantic YAML workflow engine for AI — 5 verbs, 8 providers, 10 workspace crates, LSP"
  homepage "https://github.com/supernovae-st/nika"
  url "https://github.com/supernovae-st/nika/archive/refs/tags/v0.39.0.tar.gz"
  sha256 "011f6ad217b1124c125669a4c6e28f216894650eef65b3cc0f529d7210a88773"
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
