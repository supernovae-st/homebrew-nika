# Nika — Homebrew Tap

Official Homebrew tap for [Nika](https://github.com/supernovae-st/nika),
the sovereign, local-first YAML workflow language for AI (open language +
single-binary Rust engine).

> **Status:** the engine is pre-launch — the current pre-release is
> `0.90.0` (release candidate); the first public release tags as `1.0.0`,
> after which features arrive in `1.x` minors. The language envelope
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
nika init            # repo-local schema, AGENTS.md, Cursor rule
nika wire cursor     # explicit MCP wiring for Cursor agents
```

Use `nika wire all` to patch every supported client Nika can detect. Homebrew
does not mutate editor configs automatically.

## Links

- Engine source: [github.com/supernovae-st/nika](https://github.com/supernovae-st/nika)
- Docs: [docs.nika.sh](https://docs.nika.sh)
- Website: [nika.sh](https://nika.sh)
- Issues: [github.com/supernovae-st/nika/issues](https://github.com/supernovae-st/nika/issues)

## License

- Formula files in this repo: MIT
- Nika itself: AGPL-3.0-or-later
