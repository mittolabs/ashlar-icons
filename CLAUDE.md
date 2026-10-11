# CLAUDE.md

ashlaricons' packages, one per platform, all generated from the same drawings and
released together under one version. In the Mittolabs workspace, decision `0010` is
why ashlaricons has a package repository of its own.

| Folder | Package | Registry |
|---|---|---|
| `packages/ashlar_icons` | `ashlar_icons` (Flutter, icon fonts) | pub.dev, publisher `mittolabs.com` |
| `packages/ashlar_icons_jaspr` | `ashlar_icons_jaspr` (inline SVG) | pub.dev, publisher `mittolabs.com` |
| `packages/core` | `@mittolabs/ashlar-icons-core` (the drawings as data) | npm, org `mittolabs` |
| `packages/react` | `@mittolabs/ashlar-icons-react` (one component per icon) | npm, org `mittolabs` |
| `packages/web` | `@mittolabs/ashlar-icons` (stylesheet, fonts, SVGs) | npm, org `mittolabs` |

## Generated, never edited

The private `ashlar-icons-studio` repository draws the icons with VectorCraft and
writes, through `font.mjs` then `packages.mjs`:

- `packages/ashlar_icons`: `fonts/`, `lib/` and the `fonts:` section of `pubspec.yaml`;
- `packages/ashlar_icons_jaspr/lib`, except `lib/src/icon.dart`;
- `packages/core/icons`, `packages/react/icons`;
- `packages/web`: `ashlar-icons.css`, `fonts/`, `svg/`;
- the version of every package, copied from the Flutter package's.

Change the studio and regenerate; never edit those here. Everything else (each
package's runtime, manifest, README, CHANGELOG) is written by hand. The studio
expects this repository checked out beside it, in the workspace's `products/`.

## Rules that are decided

- **Codepoints never change.** The registry lives in the studio and is
  append-only. A name keeps its codepoint forever and a retired name is never
  reused.
- **The name is ashlaricons**, one lowercase word, in anything a user reads.
- **One way to draw an icon, in every framework**: `AshlarIcon`, given the icon as
  data, in any style, with the same arguments (`size`, `color`, `secondaryColor` and
  each framework's own label). `AshlarIcon(AshlarIconsSharpSolid.calendar)` in Flutter
  and Jaspr, `<AshlarIcon icon={CalendarIcon} />` in React. Changing style changes
  only the class or the import, never the widget. No per-icon components.
- **Names match across packages**: `AshlarIconsRoundedStroke.calendar` in Dart,
  `CalendarIcon` from `<package>/<style>` in JavaScript, with Rounded Stroke at each
  package's root, `ash-calendar` in CSS.
- **One set of classes for every icon.** React and Jaspr render the web font's own
  classes, `class="ash ash-<style> ash-<name>"`, so `.ash` and `.ash-calendar` find
  every ashlaricons icon on a page whichever package drew it. The stylesheet's box
  rule is `.ash:not(:where(svg))`, so it never resizes an inline icon. (Supersedes the
  `ashlar-icon` classes, 2026-10-11.)
- **The CSS prefix is `ash`.** Ashlar UI works like shadcn/ui and has no classes of its
  own to clash with.
- **`ashlar_icons` depends only on Flutter's widgets layer**, never Material or
  Cupertino, so Ashlar UI for Flutter can build on it.
- **A secondary colour given in code is drawn as given**; only the default, and the
  CSS variable `--ash-secondary`, use the faint layer's 40%.
- Releases follow each package's `CHANGELOG.md`, share one version, and are tagged
  `v<version>`.

## Toolchain

Flutter and Dart through fvm on stable (`.fvmrc`). Never a global Flutter. Node for
the npm packages. `git config core.hooksPath .githooks` installs the commit-msg hook.

## Commits

Conventional Commits, per the workspace's `docs/engineering/commits.md`. The
scope is the area (`icons`, `flutter`, `react`, `jaspr`, `web`, `docs`), never a file.
