# Nika — Homebrew Tap

Official Homebrew tap for [Nika](https://github.com/supernovae-st/nika),
the semantic YAML workflow engine for AI.

> **Status (2026-04):** the tap currently pins `nika v0.72.0`, the last
> binary cut from the legacy branch. The engine is now in the **Diamond
> rewrite** (`nika-diamond` branch, v0.80.0, 6 / 40-42 foundation crates
> admitted). No new binary releases ship until the v0.9x arc. The
> published formula still installs v0.72.0 for users who need a working
> CLI today — expect a refreshed formula once the Diamond binary ships.

## Install

```bash
brew install supernovae-st/tap/nika
```

Or tap first, then install:

```bash
brew tap supernovae-st/tap
brew install nika
```

## Update

```bash
brew update
brew upgrade nika
```

## Uninstall

```bash
brew uninstall nika
brew untap supernovae-st/tap
```

## What you get

Prebuilt binaries for macOS (arm64, x86_64) and Linux (arm64, x86_64)
at the formula's pinned version. Run `nika --help` once installed.

## Links

- Engine source: [github.com/supernovae-st/nika](https://github.com/supernovae-st/nika)
- Docs: [docs.nika.sh](https://docs.nika.sh)
- Website: [nika.sh](https://nika.sh)
- Issues: [github.com/supernovae-st/nika/issues](https://github.com/supernovae-st/nika/issues)

## License

- Formula files in this repo: MIT
- Nika itself: AGPL-3.0-or-later
