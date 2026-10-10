# ashlaricons

6,266 icons in ten styles for Flutter, as icon fonts whose codepoints never change.
Browse them at [icons.ashlar.ke](https://icons.ashlar.ke).

| Corner | Styles |
|---|---|
| Rounded | Stroke, Solid, Duotone, Twotone, Bulk |
| Standard (corner radii halved, mitred joins) | Stroke, Solid, Duotone |
| Sharp (square corners and caps) | Stroke, Solid |

## Use

```sh
flutter pub add ashlar_icons
```

```dart
import 'package:ashlar_icons/ashlar_icons.dart';

Icon(AshlarIconsRoundedStroke.calendar, size: 24)
Icon(AshlarIconsSharpSolid.calendar)

// Duotone, Twotone and Bulk draw two layers.
AshlarLayeredIcon(
  AshlarIconsRoundedDuotone.calendar,
  color: Color(0xFF4F46E5),
  secondaryColor: Color(0xFFC7D2FE), // optional; defaults to color at 40%
)
```

Every icon is a `const IconData`, so Flutter's icon tree shaking keeps only the glyphs
your app draws, however many styles you use. The package needs only Flutter's widgets
layer, not Material or Cupertino.

## Promises

- **Codepoints never change.** An icon keeps its codepoint in every release, new icons
  are appended, and retired names are never reused.
- **Renames do not break you.** Retired names stay as deprecated constants that
  point at the new icon.
- **One clean outline per glyph.** Strokes are merged, so nothing overlaps at partial
  opacity.

## Licence

ISC, with the MIT notices of the designs it builds on. See `LICENSE`.
