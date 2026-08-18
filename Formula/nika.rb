# Formula/nika.rb — pre-built binaries, multi-arch (macOS + Linux)
# Bumped by CI on each release (release.yml → bump homebrew tap) · manual fallback:
# scripts/release/update-formula.sh (in the nika engine repo)
class Nika < Formula
  desc "Workflow language for AI - audit pipelines before they run, trace after"
  homepage "https://nika.sh"
  version "0.109.2"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-arm64-#{version}.tar.gz"
      sha256 "ca27ede081822b58f2e2998a457a216de61b595f5ac57bfee90b6c5f1cef04e0"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-x64-#{version}.tar.gz"
      sha256 "0119fcc5fd0aed82aee191367c5386f1981d98f66079a42978ffa90787adfe1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-arm64-#{version}.tar.gz"
      sha256 "e44e719a35c018c20b11ffe98787cc3a35e3039318d1a42702a9fb625e831dec"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-x64-#{version}.tar.gz"
      sha256 "5d74fda732bf72bacd5ac252983c6e4dc91a66e270f521391b282da63d917cb4"
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
        nika try 01-hello                               # offline proof - zero keys - nothing written
        nika init                                       # wire THIS repo (editor schema - AGENTS.md - Cursor rule)

      Fully local, no API key (install ollama first):
        ollama pull qwen3.5:4b
        nika try 01-hello --model ollama/qwen3.5:4b

      Editors and agents:
        nika wire cursor|claude|vscode                  # explicit MCP wiring (idempotent)
        nika new chain my-first.nika.yaml               # scaffold - then: nika check

      Agent plugin kit (skills - subagents - /nika:* commands - hooks - MCP, one bundle):
        claude plugin marketplace add supernovae-st/nika-plugins && claude plugin install nika@nika
        codex plugin marketplace add supernovae-st/nika-plugins && codex plugin add nika@nika
        nika doctor                                     # is the suite coherent? (binary - kits - keys)

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
