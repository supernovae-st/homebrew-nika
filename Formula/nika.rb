# Formula/nika.rb — pre-built binaries, multi-arch (macOS + Linux)
# Bumped by CI on each release (release.yml → bump homebrew tap) · manual fallback:
# scripts/release/update-formula.sh (in the nika engine repo)
class Nika < Formula
  desc "Workflow language for AI - audit pipelines before they run, trace after"
  homepage "https://nika.sh"
  version "0.106.1"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-arm64-#{version}.tar.gz"
      sha256 "b78c1d32fe85e5991e9c58729e833f678ae7007e1ddf9aa759785a9f32d0ca39"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-x64-#{version}.tar.gz"
      sha256 "0ed3b29c23bb9cfda876c1bf4a4b1420f6e99fdaccbe6c6705983caec1d9bc9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-arm64-#{version}.tar.gz"
      sha256 "4c1af6b87f59653843ef28bee33577d9b345323e9d1a5222e8c0ec9103bb2b26"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-x64-#{version}.tar.gz"
      sha256 "7c4afa3d0dfe0685102c2efbfb91c50df34a5c6a372a0a8106390c87a79c7e12"
    end
  end

  def install
    bin.install "nika"
    generate_completions_from_executable(bin/"nika", "completions")
  end

  def caveats
    <<~EOS
      First 60 seconds:
        nika welcome                                    # what this machine has - where to start
        nika examples run 01-hello --model mock/echo    # offline proof - zero keys
        nika init                                       # wire THIS repo (editor schema - AGENTS.md - Cursor rule)

      Fully local, no API key (install ollama first):
        ollama pull qwen3.5:4b
        nika examples run 01-hello --model ollama/qwen3.5:4b

      Editors and agents:
        nika wire cursor|claude|vscode                  # explicit MCP wiring (idempotent)
        nika new --from chain my-first.nika.yaml        # scaffold - then: nika check

      Learn: https://nika.sh - docs: https://docs.nika.sh
    EOS
  end

  test do
    # The binary self-reports its version.
    assert_match version.to_s, shell_output("#{bin}/nika --version")

    # A minimal nika: v1 workflow must pass static checking (the `check` ladder).
    (testpath/"t.nika.yaml").write <<~YAML
      nika: v1
      workflow:
        id: brew-smoke
      permits:
        exec: ["echo"]
      tasks:
        hello:
          exec: { command: ["echo", "hello"] }
    YAML
    assert_match "PLAN", shell_output("#{bin}/nika check #{testpath}/t.nika.yaml")

    # The engine must also EXECUTE, not just statically check — an install that
    # can `check` but not `run` passes the line above yet is broken for users.
    # A one-task infer under the mock provider is hermetic (no network, no key,
    # no permits) and proves the run path end to end.
    (testpath/"r.nika.yaml").write <<~YAML
      nika: v1
      workflow:
        id: brew-run-smoke
      tasks:
        greet:
          infer: { prompt: "say hello" }
    YAML
    assert_match "1/1 done",
      shell_output("#{bin}/nika run #{testpath}/r.nika.yaml --model mock/echo")
  end
end
