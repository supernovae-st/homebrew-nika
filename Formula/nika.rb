# Formula/nika.rb — Pre-built binaries, multi-arch (macOS + Linux)
# Updated automatically by CI on each release (release.yml → update-homebrew)
class Nika < Formula
  desc "Semantic YAML workflow engine for AI — 5 verbs, 9 providers, LSP"
  homepage "https://github.com/supernovae-st/nika"
  version "0.65.1"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-arm64-#{version}.tar.gz"
      sha256 "7a7ae42037db37fcc99c751fb7d04a12526fad060ebc9e906d7659298ee80d29"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-x64-#{version}.tar.gz"
      sha256 "c2d35474799fb306d36814d3ea9e4203552f596d39dfca3079ec2b35119ea536"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-arm64-#{version}.tar.gz"
      sha256 "d3238cd0f809aff8000f5401050dadb3a9d422e13db40ef8d3c743f0ff6d1cff"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-x64-#{version}.tar.gz"
      sha256 "7cd6f1b8c22a5c99d20539a2501e0c0bc5f52e154ebfd9119ac93a4f34f38533"
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
