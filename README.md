# Nika — Homebrew Tap

Official Homebrew tap for [Nika](https://github.com/supernovae-st/nika),
the sovereign, local-first YAML workflow language for AI (open language +
single-binary Rust engine).

> **Status:** the engine is pre-launch — the first runnable public binary
> tags as `v0.81.0` (the vertical slice; the surface then completes through
> `v0.8x` minors toward `v0.90`). This tap is a placeholder until then; the
> working `nika` formula ships when that binary tags. Follow [the engine
> repo](https://github.com/supernovae-st/nika) and [docs.nika.sh](https://docs.nika.sh).

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
