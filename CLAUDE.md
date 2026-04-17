# homebrew-tap

**Homebrew Tap** for [Nika](https://github.com/supernovae-st/nika).

## Installation

```bash
brew install supernovae-st/tap/nika
```

## Formulas

| Formula | Description |
|---------|-------------|
| `nika` | Semantic YAML workflow engine for AI |

## Structure

```
homebrew-tap/
├── Formula/
│   └── nika.rb       # Workflow engine
├── README.md
└── CLAUDE.md
```

## Updating the Formula

> As of 2026-04, the engine is in the Diamond rewrite (v0.80.0,
> `nika-diamond` branch) and the binary is not being re-cut. The
> formula stays pinned at v0.72.0 until the v0.9x arc ships a new
> tagged release. Do not bump speculatively.

When a new Nika version is released:

1. Verify release assets exist: `gh release view vX.Y.Z --repo supernovae-st/nika --json assets`
2. Update the `version` field in `Formula/nika.rb`
3. Update each `sha256` from the `.sha256` files published alongside the tarballs
4. Test locally: `brew install --build-from-source Formula/nika.rb`

The release tarball naming convention is:

```
nika-{macos|linux}-{arm64|x64}-{version}.tar.gz
```

## Related Repos

| Repo | Description |
|------|-------------|
| [nika](https://github.com/supernovae-st/nika) | Nika source code |

## Conventions

- Follow [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- Multi-platform support via `on_macos` / `on_linux` blocks
- Include SHA256 checksums for every download
- Only bump the formula when release assets are confirmed published
