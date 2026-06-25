# Formula/nika.rb — pre-built binaries, multi-arch (macOS + Linux)
# Bumped by CI on each release (release.yml → bump homebrew tap) · manual fallback:
# scripts/release/update-formula.sh (in the nika engine repo)
class Nika < Formula
  desc "Intent as Code — the open language + local runtime for AI workflows"
  homepage "https://github.com/supernovae-st/nika"
  version "0.91.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-arm64-#{version}.tar.gz"
      sha256 "1116f1e718bbe925f65c3c81e338be049dd2db3e30a3c511e62471d827882d11"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-x64-#{version}.tar.gz"
      sha256 "25885a16e04007a280e705128163a51ba59f20ad39f9f948a1dfff60e6164268"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-arm64-#{version}.tar.gz"
      sha256 "d97de366fedee5f52a523b950d72e6b01589c3695b65601424a59e4900de9830"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-x64-#{version}.tar.gz"
      sha256 "b68f6a0ad8dc2f8eb5734576585410bca6c397c95cf68e0026e990b1b93f579a"
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
