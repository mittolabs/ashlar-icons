# ashlaricons

6,791 icons in ten styles for Flutter, as icon fonts whose codepoints never change.
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

Every icon is a `const IconData`, so it also works anywhere Flutter takes one:

```dart
Icon(AshlarIconsRoundedStroke.house)
SomeNavItem(icon: AshlarIconsRoundedStroke.house)
```

In Duotone, Twotone and Bulk, draw with `AshlarIcon`: `Icon` draws only the main layer.

Release builds keep only the glyphs your app draws. An app that uses one icon ships
under 1 KB of each style's font. The faint layers of Duotone, Twotone and Bulk are the
exception: their three fonts ship whole, about 740 KB in all, because nothing in your
code names their glyphs. The package needs only Flutter's widgets layer, not Material
or Cupertino.

## Flags

271 flags of countries and regions, drawn in colour: 4:3 in a rectangle with rounded
corners (`AshlarFlags`) or 1:1 in a circle (`AshlarFlagsCircle`). A flag is named by
its code in upper case, as a country picker keeps it.

```dart
AshlarFlag(AshlarFlags.KE)
AshlarFlag(AshlarFlagsCircle.KE, size: 32, semanticLabel: 'Kenya')

// A country picker, by code. Using byCode keeps every flag in the build.
AshlarFlag(AshlarFlags.byCode[country.code]!)
```

`AshlarFlag` draws with Flutter's canvas, so it needs no other package. Only the flags
you use end up in a release build, unless you use `byCode`.

## Countries and continents

Outlines of 231 countries and territories and 7 continents, as icons in all ten styles,
named `country-<name>` and `continent-<name>`: `AshlarIcon(AshlarIconsRoundedSolid.countryKenya)`, `AshlarIconsRoundedStroke.continentAfrica`.

## Promises

- **Codepoints never change.** An icon keeps its codepoint in every release, new icons
  are appended, and retired names are never reused.
- **Renames do not break you.** Retired names stay as deprecated constants that
  point at the new icon.
- **One clean outline per glyph.** Strokes are merged, so nothing overlaps at partial
  opacity.

## Licence

ISC, with the MIT notices of the designs it builds on in `NOTICE`. See `LICENSE`.
