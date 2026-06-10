# AGENTS.md — homebrew-tap (Nika)

Vendor-neutral agent entry per the AGENTS.md convention (agents.md).

## What this repo is

The official **Homebrew tap** for [Nika](https://github.com/supernovae-st/nika)
— `brew install supernovae-st/tap/nika`. One formula (`Formula/nika.rb`).

## Load-bearing facts (verify in-repo · never from memory)

- The engine is **pre-launch**. The first runnable public binary tags
  **`v0.81.0`** (the vertical slice) — the working formula ships with that
  tag. The surface then completes through `v0.8x` minors (`v0.90` = the
  full-surface milestone). The version communicated is always the real tag.
- The language spec lives at `supernovae-st/nika-spec` (Apache-2.0) ·
  the engine at `supernovae-st/nika` (AGPL-3.0-or-later) · docs at
  `docs.nika.sh`.

## Editing rules

1. The formula tracks REAL tags on the engine repo — never a version that
   does not exist as a git tag.
2. Commit trailer: `Co-Authored-By: Nika 🦋 <nika@supernovae.studio>`.
