# Nika Homebrew Tap

Official Homebrew tap for [Nika](https://github.com/supernovae-st/nika):
**Intent as Code**, the workflow language for AI: one file, 4 verbs, one
binary. Sovereign, local-first (open language + single-binary Rust engine).

> **Status:** the formula tracks the latest tagged release — the exact pin
> lives in [`Formula/nika.rb`](Formula/nika.rb) (this README never repeats
> it; a repeated number is a number that rots). The language envelope
> `nika: v1` is already stable.

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

## First run

```bash
nika doctor          # environment + editor/agent readiness
nika init            # repo-local schema + AGENTS.md
```

Homebrew does not mutate editor configs automatically. If your installed
`nika --help` lists `wire`, run `nika wire cursor` or `nika wire all` for
explicit MCP setup; otherwise use the editor extension setup.

## Links

- Engine source: [github.com/supernovae-st/nika](https://github.com/supernovae-st/nika)
- Docs: [docs.nika.sh](https://docs.nika.sh)
- Website: [nika.sh](https://nika.sh)
- Issues: [github.com/supernovae-st/nika/issues](https://github.com/supernovae-st/nika/issues)

## License

- Formula files in this repo: MIT
- Nika itself: AGPL-3.0-or-later
