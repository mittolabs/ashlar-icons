# @mittolabs/ashlar-icons-react

ashlaricons for React: 6,266 icons in ten styles, each a component that draws inline
SVG. Browse them at [icons.ashlar.ke](https://icons.ashlar.ke).

| Corner | Styles |
|---|---|
| Rounded | Stroke, Solid, Duotone, Twotone, Bulk |
| Standard (corner radii halved, mitred joins) | Stroke, Solid, Duotone |
| Sharp (square corners and caps) | Stroke, Solid |

## Use

```sh
npm install @mittolabs/ashlar-icons-react
```

```tsx
import { CalendarIcon } from '@mittolabs/ashlar-icons-react';
import { CalendarIcon as SharpCalendarIcon } from '@mittolabs/ashlar-icons-react/sharp-solid';

<CalendarIcon />
<CalendarIcon className="size-4 text-muted-foreground" />
<SharpCalendarIcon size={32} color="#4f46e5" aria-label="Calendar" />
```

The package's root is Rounded Stroke; every style is `@mittolabs/ashlar-icons-react/<style>`
(`rounded-duotone`, `standard-stroke`, `sharp-solid`, ...), with the same names in each.

An icon is an `<svg>`: it takes the text colour, is 24 pixels unless you size it, and
passes every other prop and `className` through, so utility classes such as `size-4`
work. Without an `aria-label` it is hidden from screen readers, as decoration should be.

Every icon is also exported with the set in its name, `AshlarCalendar` beside
`CalendarIcon`, for code that should say whose icon it is, or an app that already
has another set's `CalendarIcon`. Both are the same component. Rendered, each icon
carries the classes `ashlar-icon ashlar-icon-calendar`, so every ashlaricons icon on
a page can be found or styled at once.

Only the icons you import end up in your bundle.

## Two-layer styles

Duotone, Twotone and Bulk draw a faint layer at 40%. Give it a colour of its own with
`secondaryColor`, or from CSS with `--ash-secondary` (and `--ash-secondary-opacity`):

```tsx
import { CalendarIcon } from '@mittolabs/ashlar-icons-react/rounded-duotone';

<CalendarIcon color="#4f46e5" secondaryColor="#c7d2fe" />
<CalendarIcon className="text-primary [--ash-secondary:var(--color-primary)]" />
```

## Any icon by value

`AshlarIcon` draws an icon passed as data from `@mittolabs/ashlar-icons-core`, for
when the icon is chosen at run time:

```tsx
import { AshlarIcon } from '@mittolabs/ashlar-icons-react';
import { HouseIcon } from '@mittolabs/ashlar-icons-core/rounded-bulk';

<AshlarIcon icon={HouseIcon} size={20} />
```

## Licence

ISC, with the MIT notices of the designs it builds on. See `LICENSE`.
