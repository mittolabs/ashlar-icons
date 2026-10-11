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

AshlarIcon(AshlarIconsRoundedStroke.calendar)
AshlarIcon(AshlarIconsSharpSolid.calendar, size: 32, semanticLabel: 'Calendar')

// Duotone, Twotone and Bulk draw a faint layer at 40%, or in its own colour.
AshlarIcon(
  AshlarIconsRoundedDuotone.calendar,
  color: Color(0xFF4F46E5),
  secondaryColor: Color(0xFFC7D2FE),
)
```

`AshlarIcon` draws every style, so changing style is changing the class name. It is
sized and coloured by the `IconTheme` like Flutter's `Icon`, so buttons, app bars and
navigation bars style it as they would any icon.

For a widget that only takes an `IconData`, use the icon's `iconData`:

```dart
SomeNavItem(icon: AshlarIconsRoundedStroke.house.iconData)
```

Every icon is a `const`, so Flutter's icon tree shaking keeps only the glyphs your app
draws, however many styles you use. The package needs only Flutter's widgets layer,
not Material or Cupertino.

## Promises

- **Codepoints never change.** An icon keeps its codepoint in every release, new icons
  are appended, and retired names are never reused.
- **Renames do not break you.** Retired names stay as deprecated constants that
  point at the new icon.
- **One clean outline per glyph.** Strokes are merged, so nothing overlaps at partial
  opacity.

## Licence

ISC, with the MIT notices of the designs it builds on. See `LICENSE`.
