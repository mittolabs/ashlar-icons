# CLAUDE.md

ashlaricons for Flutter: the `ashlar_icons` package, published to pub.dev. In the
Mittolabs workspace, decision `0010` is why it has a repository of its own.

## Generated, never edited

`fonts/`, `lib/` and the `fonts:` section of `pubspec.yaml` are written by
`font.mjs` in the private `ashlar-icons-studio` repository, which draws the icons
with VectorCraft. Change the studio and regenerate; never edit them here. The
studio expects this repository checked out beside it, in the workspace's
`products/`.

## Rules that are decided

- **Codepoints never change.** The registry lives in the studio and is
  append-only. A name keeps its codepoint forever and a retired name is never
  reused.
- **The name is ashlaricons**, one lowercase word, in anything a user reads.
- Releases follow `CHANGELOG.md` and are tagged `v<version>`.

## Toolchain

Flutter and Dart through fvm on stable (`.fvmrc`). Never a global Flutter.
`git config core.hooksPath .githooks` installs the commit-msg hook.

## Commits

Conventional Commits, per the workspace's `docs/engineering/commits.md`. The
scope is the area (`icons`, `layered`, `docs`), never a file.
