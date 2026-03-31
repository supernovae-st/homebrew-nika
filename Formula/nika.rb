# Formula/nika.rb
# v0.54.0: Security Hardening + Audit Fixes — 9057 tests, 91 E2E workflows
# Features: TUI, media pipeline, LSP, daemon, custom endpoints, structured output
class Nika < Formula
  desc "Semantic YAML workflow engine for AI — 5 verbs, 9 providers, 12 workspace crates, LSP"
  homepage "https://github.com/supernovae-st/nika"
  url "https://github.com/supernovae-st/nika/archive/refs/tags/v0.54.0.tar.gz"
  sha256 "a93dbe449bc09df2cb69cbc9caaf3bf986fd2208a526dda10b620f70ee835b38"
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
