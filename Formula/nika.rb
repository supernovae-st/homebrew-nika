# Formula/nika.rb — Pre-built binaries, multi-arch (macOS + Linux)
# Updated automatically by CI on each release (release.yml → update-homebrew)
class Nika < Formula
  desc "Semantic YAML workflow engine for AI — 5 verbs, 9 providers, LSP"
  homepage "https://github.com/supernovae-st/nika"
  version "0.72.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-arm64-#{version}.tar.gz"
      sha256 "cc16b042586eb9b89f43d986164a7bce04311793e44b404052e133403b953beb"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-macos-x64-#{version}.tar.gz"
      sha256 "934c7f0cfd3eb90143196b3ec1c31605c51b828f09c147583d2d64b3a1754b7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-arm64-#{version}.tar.gz"
      sha256 "a673206e92ae601cf9833c599c3c26af9ecf12448315e7f15a1c8b3037c542e5"
    else
      url "https://github.com/supernovae-st/nika/releases/download/v#{version}/nika-linux-x64-#{version}.tar.gz"
      sha256 "0bcc53bfeccd3196863e778f4621af2624a49ae54b090a46c74d60c7041130a4"
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
