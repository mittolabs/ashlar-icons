# @mittolabs/ashlar-icons-core

The ashlaricons drawings as data: 6,553 icons in ten styles, on a 24 by 24 grid.
Browse them at [icons.ashlar.ke](https://icons.ashlar.ke).

This package is what the framework packages draw from. To put icons in an app, use
one of those instead:

- React: [`@mittolabs/ashlar-icons-react`](https://www.npmjs.com/package/@mittolabs/ashlar-icons-react)
- Any web page: [`@mittolabs/ashlar-icons`](https://www.npmjs.com/package/@mittolabs/ashlar-icons), the stylesheet, fonts and SVGs
- Flutter: [`ashlar_icons`](https://pub.dev/packages/ashlar_icons); Jaspr: [`ashlar_icons_jaspr`](https://pub.dev/packages/ashlar_icons_jaspr)

## The data

Each style is its own module, and each icon a named export. The package root is
Rounded Stroke:

```js
import { CalendarIcon } from '@mittolabs/ashlar-icons-core/rounded-duotone';
// { name: 'calendar', layers: [['M3 5c0-1.1.9-2 2-2h14...', 1], ['M7 2c0-.55.45-1 1-1...']] }
```

An icon is its name and its layers, drawn bottom to top. Each layer is its path data, plus a `1`
when it is the faint layer of a two-layer style (Duotone, Twotone, Bulk), which is
drawn at 40% or in its own colour. Draw every layer as a filled path:

```js
const svg = `<svg viewBox="0 0 24 24" fill="currentColor">${CalendarIcon.layers
  .map(([d, faint]) => `<path d="${d}"${faint ? ' opacity=".4"' : ''}/>`)
  .join('')}</svg>`;
```

Only the icons you import end up in your bundle.

## Licence

ISC, with the MIT notices of the designs it builds on in `NOTICE`. See `LICENSE`.
