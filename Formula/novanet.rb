# Formula/novanet.rb
class Novanet < Formula
  desc "Knowledge graph CLI + TUI with MCP server for AI applications"
  homepage "https://github.com/supernovae-st/novanet"
  version "0.16.2"
  license "LicenseRef-Proprietary"

  # Build from source - no pre-built binaries available
  url "https://github.com/supernovae-st/novanet.git",
      tag:      "v0.16.2",
      revision: "HEAD"

  depends_on "rust" => :build

  def install
    cd "novanet/tools/novanet" do
      system "cargo", "install", *std_cargo_args
    end
  end

  def caveats
    <<~EOS
      NovaNet requires Neo4j database for full functionality.

      To start Neo4j:
        brew services start neo4j

      Or use Docker:
        docker run -d --name neo4j -p 7474:7474 -p 7687:7687 neo4j
    EOS
  end

  test do
    assert_match "novanet", shell_output("#{bin}/novanet --version")
  end
end
