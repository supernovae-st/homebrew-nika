# Formula/nika.rb — pre-built binaries, multi-arch (macOS + Linux)
# Bumped by CI on each release (release.yml → bump homebrew tap) · manual fallback:
# scripts/release/update-formula.sh (in the nika engine repo)
class Nika < Formula
  desc "Intent as Code — the open language + local runtime for AI workflows"
  homepage "https://github.com/supernovae-st/nika"
  version "0.92.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-arm64-#{version}.tar.gz"
      sha256 "1e60f248aed0a06cb41de20f229cd3bdaf9f2445e32f80b31ef97d29a5386b81"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-x64-#{version}.tar.gz"
      sha256 "877825c90a09d02d6b60e9b0a3dca1d00e96f391bee5be064312f050454c6e25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-arm64-#{version}.tar.gz"
      sha256 "46267b4dec7c886ec8c1428baf9f1240dad6c81c1431174c03ff264f07e871fe"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-x64-#{version}.tar.gz"
      sha256 "45a3d79ba9ea715c195a919487b88113e7243f3908aea93f2204b2df40811f7e"
    end
  end

  def install
    bin.install "nika"
  end

  def caveats
    <<~EOS
      Next steps:
        nika doctor
        nika init

      `nika init` scaffolds repo-local schema + AGENTS.md for this release.
      MCP wiring is explicit; use the editor extension or upgrade to a release
      whose `nika --help` lists `wire`.
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
