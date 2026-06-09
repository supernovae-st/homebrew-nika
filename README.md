# Nika — Homebrew Tap

Official Homebrew tap for [Nika](https://github.com/supernovae-st/nika),
the sovereign, local-first YAML workflow language for AI (open language +
single-binary Rust engine).

> **Status:** the tap pins `nika v0.72.0`, the last binary cut from the
> legacy engine. The engine is now in the open **Diamond rewrite** (the
> `main` branch — see the [engine repo](https://github.com/supernovae-st/nika)
> for the live crate roster). No new binary releases ship until the v0.90
> arc; the published formula still installs v0.72.0 for users who want a
> working CLI today. A refreshed formula ships once the Diamond binary tags.

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
