# Formula/nika.rb
# v0.51.0: Quality overhaul — 8700+ tests, custom endpoints, H100 vLLM
# Features: TUI, keychain, media pipeline, LSP, daemon, custom endpoints
class Nika < Formula
  desc "Semantic YAML workflow engine for AI — 5 verbs, 8 providers, 12 workspace crates, LSP"
  homepage "https://github.com/supernovae-st/nika"
  # Stable release (update sha256 when v0.51.0 tag is cut)
  url "https://github.com/supernovae-st/nika/archive/refs/tags/v0.41.0.tar.gz"
  sha256 "96ef20ae7e163af7b663fb2dfb7ceb43ed985dfa62b2337b8891cf9929089341"
  license "AGPL-3.0-or-later"
  head "https://github.com/supernovae-st/nika.git", branch: "main"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  def install
    cd "tools" do
      system "cargo", "install", "--path", "nika",
             "--root", prefix
    end
  end

  def post_install
    return unless OS.mac? || OS.linux?

    # Non-fatal: setup will run on first nika command if this fails
    Timeout.timeout(15) do
      system bin/"nika", "--quiet", "daemon", "start"
    end
  rescue Timeout::Error, StandardError
    # Silently ignore — setup will run on first nika command
  end

  test do
    assert_match "nika 0.", shell_output("#{bin}/nika --version")

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
