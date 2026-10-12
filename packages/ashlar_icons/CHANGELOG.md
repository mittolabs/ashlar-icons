## 0.3.0

- 271 flags of countries and regions, in colour, in a rectangle or a circle (AshlarFlag).
- Outlines of 231 countries and territories and 7 continents, as icons in all ten styles.
- 6,791 icons in all.

## 0.2.0

- Release builds now keep only the icons an app uses. Before, Flutter's icon tree
  shaking kept every glyph, so an app shipped about 16 MB of fonts; an app using one
  icon now ships under 1 KB of each style's font, plus about 740 KB for the faint layers
  of Duotone, Twotone and Bulk.
- Every icon is a plain `const IconData` again, so it works with `Icon` and any widget
  that takes `IconData`. `AshlarIconData` and `.iconData` remain as deprecated aliases.

## 0.1.1

- The licence is plain ISC in `LICENSE`, with the notices of the designs it builds on in
  `NOTICE`, so registries recognise it.
- Every icon is documented with a picture of itself, so an editor's hover shows it.

## 0.1.0

- First release: 6,553 icons in ten styles (Rounded Stroke, Solid,
  Duotone, Twotone and Bulk; Standard Stroke, Solid and Duotone; Sharp Stroke and
  Solid), each drawn with `AshlarIcon`.
