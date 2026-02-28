# homebrew-tap

**Homebrew Tap** for SuperNovae ecosystem tools.

## Installation

```bash
brew tap supernovae-st/tap
brew install spn          # Installs spn + nika + novanet
```

## Formulas

| Formula | Description | Dependencies |
|---------|-------------|--------------|
| `spn` | SuperNovae CLI (package manager) | nika, novanet |
| `nika` | YAML workflow engine | - |
| `novanet` | Knowledge graph CLI | - |

## Structure

```
homebrew-tap/
├── Formula/
│   ├── spn.rb        # Main CLI (depends on nika + novanet)
│   ├── nika.rb       # Workflow engine
│   └── novanet.rb    # Knowledge graph
└── README.md
```

## Updating Formulas

When a new version is released:

1. Update the `version` field
2. Update the `url` to point to new release
3. Update the `sha256` checksums for each platform

```ruby
# Example: Formula/spn.rb
version "0.2.0"
url "https://github.com/supernovae-st/supernovae-cli/releases/download/v0.2.0/spn-aarch64-apple-darwin.tar.gz"
sha256 "new_sha256_hash"
```

## Related Repos

| Repo | Description |
|------|-------------|
| [supernovae-cli](https://github.com/supernovae-st/supernovae-cli) | spn source code |
| [nika](https://github.com/supernovae-st/nika) | nika source code |
| [novanet](https://github.com/supernovae-st/novanet) | novanet source code |

## Conventions

- Follow [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- Use multi-platform support with `on_macos`/`on_linux` blocks
- Include SHA256 checksums for all downloads
