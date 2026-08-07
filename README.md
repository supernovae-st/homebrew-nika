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

## Your first minute

Right after the install, the binary greets the machine and the first proof
runs offline on the mock provider, zero keys (recorded against the released
binary · `scripts/media/first-minute.tape`):

<p align="center">
  <img src="media/first-minute.gif" alt="nika welcome mirrors the machine (editors, local providers, keys, workspace), then nika try 01-hello rehearses the first workflow offline on the mock provider, zero keys, nothing written" width="820">
</p>

## What the formula installs

Prebuilt binaries for macOS (arm64, x86_64) and Linux (arm64, x86_64),
each pinned to a per-architecture sha256 checksum in
[`Formula/nika.rb`](Formula/nika.rb). The formula is bumped by CI on every
engine release; this README never repeats the version, because a repeated
number is a number that rots.

Shell completions are generated from the binary itself at install time
(bash, zsh, fish).

**What you install is checksummed; what you run is contract-carrying.**
Every workflow the installed binary runs can declare a `permits:` block:
a default-deny boundary over filesystem paths, network hosts, exec
programs and tool ids, enforced by the engine at runtime, not just
parsed from YAML. Every run can leave a hash-chained trace, checked
after the fact with `nika trace verify`. This tap's own CI runs on
SHA-pinned actions with no user-controlled input reaching a shell.

## First run

```bash
nika welcome         # the mirror: what this machine has, where to start
nika try 01-hello    # offline proof, zero keys, nothing written
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

<!-- city:map -->
## The city · where this repo sits

```
📜 nika-spec ──── the civil code · the law tables, the corpus, the exam
    │ sync-pack: byte-gated mirror        │ projectors: drift-gated
    ▼                                     ▼
⚙️ nika ───────── the engine + the catalog (the yellow pages)
    │ the release train                  🖥️ nika.sh · 📖 nika-docs
    ▼                                     the showroom · the manual
📦 homebrew-tap · npm · Docker ── the docks   ◀── you are here
🔌 nika-client · 🎨 nika-vscode · 🤖 nika-plugins · ⚡ gh-nika ── the doors
🏭 nika-action · 🧪 nika-actions-starter ── the CI district
🏪 nika-registry ── the market · 🏛 nika-estate ── the land registry
```

**This building** · THE DOCKS · the brew lane of the release train.

**Root** · neither · this building ships the ENGINE's artifacts. Every formula pins a released build by sha256 · nothing authoritative is typed here.

**Consumes** · the engine's release assets (sha-pinned bottles · the heal follows the train).

**Serves** · `brew install supernovae-st/tap/nika`.

**Truth lives** · the formula follows releases · only the caveats are authored here.

All the buildings: [nika-spec](https://github.com/supernovae-st/nika-spec) · [nika](https://github.com/supernovae-st/nika) · [nika.sh](https://github.com/supernovae-st/nika.sh) · [nika-docs](https://github.com/supernovae-st/nika-docs) · [nika-client](https://github.com/supernovae-st/nika-client) · [nika-vscode](https://github.com/supernovae-st/nika-vscode) · [nika-plugins](https://github.com/supernovae-st/nika-plugins) · [gh-nika](https://github.com/supernovae-st/gh-nika) · [homebrew-tap](https://github.com/supernovae-st/homebrew-tap) · [nika-action](https://github.com/supernovae-st/nika-action) · [nika-actions-starter](https://github.com/supernovae-st/nika-actions-starter) · [nika-registry](https://github.com/supernovae-st/nika-registry) · [nika-estate](https://github.com/supernovae-st/nika-estate)

Every fact has one home · everything else is a gated projection.
The living map: [nika.sh/map](https://nika.sh/map).
<!-- /city:map -->

## License

Formula files in this repo: MIT. Nika itself: AGPL-3.0-or-later.

<p align="center">
  <sub>Docs: <a href="https://docs.nika.sh">docs.nika.sh</a> · Engine: <a href="https://github.com/supernovae-st/nika">nika</a> · Issues: <a href="https://github.com/supernovae-st/nika/issues">engine tracker</a> · Template: <a href="https://github.com/supernovae-st/nika-actions-starter">nika-actions-starter</a></sub>
</p>
