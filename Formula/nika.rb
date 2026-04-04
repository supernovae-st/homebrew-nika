# Formula/nika.rb — Pre-built binaries, multi-arch (macOS + Linux)
# Updated automatically by CI on each release (release.yml → update-homebrew)
class Nika < Formula
  desc "Semantic YAML workflow engine for AI — 5 verbs, 9 providers, LSP"
  homepage "https://github.com/supernovae-st/nika"
  version "0.67.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-arm64-#{version}.tar.gz"
      sha256 "f3bb2b49ff562d6a22cbb968d6b7c698b0fc53ea709e9210cf5750321d7bce5f"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-x64-#{version}.tar.gz"
      sha256 "e1eaf554c1e455adda3af9e2a7a9f1628223a1f95c8d3ea16f1d6d5c14bcebda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-arm64-#{version}.tar.gz"
      sha256 "5c50650cd169e06094e916faf322e9a4f7f46b620105be2218a30c673e988260"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-x64-#{version}.tar.gz"
      sha256 "65195b68a64a5a258b74993ddff9a6f7f242586c726fd33c54b1462df6febb0e"
    end
  end

  def install
    bin.install "nika"
  end

  def post_install
    return unless OS.mac? || OS.linux?

    # Non-fatal: daemon will start on first nika command if this fails
    Timeout.timeout(15) do
      system bin/"nika", "--quiet", "daemon", "start"
    end
  rescue Timeout::Error, StandardError
    # Silently ignore — daemon starts on first use
  end

  test do
    assert_match "nika #{version}", shell_output("#{bin}/nika --version")

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
