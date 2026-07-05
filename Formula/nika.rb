# Formula/nika.rb — pre-built binaries, multi-arch (macOS + Linux)
# Bumped by CI on each release (release.yml → bump homebrew tap) · manual fallback:
# scripts/release/update-formula.sh (in the nika engine repo)
class Nika < Formula
  desc "Intent as Code — the open language + local runtime for AI workflows"
  homepage "https://github.com/supernovae-st/nika"
  version "0.93.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-arm64-#{version}.tar.gz"
      sha256 "03101e129136f0b87663c6070bc41c97ea0b541ed8dbedc57730190a0c4d9589"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-x64-#{version}.tar.gz"
      sha256 "236a390d160268a56f5082e4529c164384fc4e6ea51f4c874ee2ecccbbcc525d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-arm64-#{version}.tar.gz"
      sha256 "e9b9e94999ec2647c3da64325e9888f4f10451d304ce9cc75904aea256107570"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-x64-#{version}.tar.gz"
      sha256 "4061072821cb928ad6a1590a9aad8813efa174090c8b7a191e3c5ebdae6c4066"
    end
  end

  def install
    bin.install "nika"
  end

  def caveats
    <<~EOS
      First 60 seconds:
        nika examples run 01-hello --model mock/echo    # offline proof - zero keys
        nika doctor                                     # what's wired - what's missing
        nika init                                       # wire THIS repo (editor schema - AGENTS.md - Cursor rule)

      Fully local, no API key (install ollama first):
        ollama pull qwen3.5:4b
        nika examples run 01-hello --model ollama/qwen3.5:4b

      Editors and agents:
        nika wire cursor|claude|vscode                  # explicit MCP wiring (idempotent)
        nika new --from chain my-first.nika.yaml        # scaffold - then: nika check
    EOS
  end

  test do
    # The binary self-reports its version.
    assert_match version.to_s, shell_output("#{bin}/nika --version")

    # A minimal nika: v1 workflow must pass static checking (the `check` ladder).
    (testpath/"t.nika.yaml").write <<~YAML
      nika: v1
      workflow: brew-smoke
      tasks:
        - id: hello
          exec: { command: "echo hello" }
    YAML
    assert_match "PLAN", shell_output("#{bin}/nika check #{testpath}/t.nika.yaml")
  end
end
