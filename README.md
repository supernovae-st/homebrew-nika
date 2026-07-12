<p align="center">
  <a href="https://nika.sh">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://nika.sh/brand/nika-logo-dark.svg">
      <img src="https://nika.sh/brand/nika-logo-light.svg" alt="Nika" width="220">
    </picture>
  </a>
</p>

<h1 align="center">Nika Homebrew Tap</h1>

<p align="center"><strong>One command, one binary.</strong><br>
The official tap for <a href="https://github.com/supernovae-st/nika">Nika</a>:
the workflow language for AI. One file, 4 verbs, one binary. Local-first,
any model, AGPL-3.0.</p>

> **Status:** the formula tracks the latest tagged release. The exact pin
> lives in [`Formula/nika.rb`](Formula/nika.rb) (this README never repeats
> it; a repeated number is a number that rots). The language envelope
> `nika: v1` is already stable.

## Install

```bash
brew install supernovae-st/tap/nika
```

<p align="center">
  <img src="https://raw.githubusercontent.com/supernovae-st/nika/main/media/nika-hero.gif" alt="nika check audits the workflow (plan, cost, secrets, types), then nika run executes it locally" width="820">
</p>

## What the formula installs

Prebuilt binaries for macOS (arm64, x86_64) and Linux (arm64, x86_64),
each pinned to a per-architecture sha256 checksum in
[`Formula/nika.rb`](Formula/nika.rb). The formula is bumped by CI on every
engine release; this README never repeats the version, because a repeated
number is a number that rots.

Shell completions are generated from the binary itself at install time
(bash, zsh, fish).

## First run

```bash
nika welcome         # the mirror: what this machine has, where to start
nika examples run 01-hello --model mock/echo   # offline proof, zero keys
nika doctor          # environment + editor/agent readiness, with the fixes
nika init            # repo wiring: schema, AGENTS.md, editor + agent files
```

Homebrew never mutates your editor configs. Wiring an editor or agent to
the MCP oracle is an explicit act: `nika wire cursor`, `nika wire all`.

## Update / uninstall

```bash
brew update && brew upgrade nika
brew uninstall nika && brew untap supernovae-st/tap
```

## License

Formula files in this repo: MIT. Nika itself: AGPL-3.0-or-later.

<p align="center">
  <sub>Docs: <a href="https://docs.nika.sh">docs.nika.sh</a> · Engine: <a href="https://github.com/supernovae-st/nika">nika</a> · Issues: <a href="https://github.com/supernovae-st/nika/issues">engine tracker</a> · Templates: <a href="https://github.com/supernovae-st/nika-starter">nika-starter</a> · <a href="https://github.com/supernovae-st/nika-actions-starter">nika-actions-starter</a></sub>
</p>
