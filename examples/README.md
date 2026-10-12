# Examples

The same page in each framework, written only with the documented API and installed
from the registries, not from this repository, so each tests what users get.

| Example | Package | Run |
|---|---|---|
| [`flutter_app`](flutter_app) | `ashlar_icons` | `fvm flutter run` (iOS, Android or web) |
| [`react_app`](react_app) | `@mittolabs/ashlar-icons-react` | `npm install && npm run dev` |
| [`jaspr_app`](jaspr_app) | `ashlar_icons_jaspr` | `fvm dart pub get && jaspr serve` |
| [`web`](web) | `@mittolabs/ashlar-icons`, from the CDN | open `index.html`, or serve the folder |

Each shows icons in a real screen (a navigation that switches a tab from Stroke to
Solid when it is selected, a list, header buttons), size and colour, the two-layer
styles with and without their own second colour, and all ten styles.

A release build keeps only the icons a page uses:

- Flutter: every main-layer font is trimmed to the glyphs drawn (under 1 KB each for one
  icon); the faint-layer fonts of Duotone, Twotone and Bulk ship whole, about 740 KB.
- React and Jaspr: only the drawings imported reach the bundle.
