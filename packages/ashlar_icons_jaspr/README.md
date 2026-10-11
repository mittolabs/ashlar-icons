# ashlaricons for Jaspr

6,553 icons in ten styles for [Jaspr](https://jaspr.site), drawn as inline SVG, so
they render on the server and need nothing loaded. Browse them at
[icons.ashlar.ke](https://icons.ashlar.ke).

| Corner | Styles |
|---|---|
| Rounded | Stroke, Solid, Duotone, Twotone, Bulk |
| Standard (corner radii halved, mitred joins) | Stroke, Solid, Duotone |
| Sharp (square corners and caps) | Stroke, Solid |

## Use

```sh
dart pub add ashlar_icons_jaspr
```

```dart
import 'package:ashlar_icons_jaspr/ashlar_icons_jaspr.dart';

AshlarIcon(AshlarIconsRoundedStroke.calendar)
AshlarIcon(AshlarIconsSharpSolid.calendar, size: 32, classes: 'text-indigo-600')
AshlarIcon(AshlarIconsRoundedStroke.bell, label: 'Notifications')

// Duotone, Twotone and Bulk draw a faint layer at 40%, or in its own colour.
AshlarIcon(
  AshlarIconsRoundedDuotone.calendar,
  color: Color('#4f46e5'),
  secondaryColor: Color('#c7d2fe'),
)
```

The icons and style classes have the same names as in the Flutter package,
[`ashlar_icons`](https://pub.dev/packages/ashlar_icons). An icon takes the text colour
and is 24 pixels unless you size it; a class that sets its size overrides that. Without
a `label` it is hidden from screen readers, as decoration should be. The faint layer
also follows the CSS variables `--ash-secondary` and `--ash-secondary-opacity`.

Rendered, each icon carries the web font's classes, `ash ash-rounded-stroke ash-calendar`,
before your own, so every ashlaricons icon on a page, inline or font, answers to the
same selectors. Loading the stylesheet as well does not resize it.

Every icon is a `const AshlarIconData`, so a compiled site keeps only the icons it uses.

## Licence

ISC, with the MIT notices of the designs it builds on in `NOTICE`. See `LICENSE`.
