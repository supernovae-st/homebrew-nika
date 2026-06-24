# Nika — Homebrew Tap

Official Homebrew tap for [Nika](https://github.com/supernovae-st/nika),
the sovereign, local-first YAML workflow language for AI (open language +
single-binary Rust engine).

> **Status:** the formula tracks the latest tagged release, currently
> `0.90.0` (release candidate). The 1.0 public API lock ships when the
> release gates are green, then features arrive in `1.x` minors. The language envelope
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
