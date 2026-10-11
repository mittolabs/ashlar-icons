# @mittolabs/ashlar-icons-react

ashlaricons for React: 6,266 icons in ten styles, drawn as inline SVG by one
component. Browse them at [icons.ashlar.ke](https://icons.ashlar.ke).

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
import { AshlarIcon, CalendarIcon } from '@mittolabs/ashlar-icons-react';

<AshlarIcon icon={CalendarIcon} />
<AshlarIcon icon={CalendarIcon} className="size-4 text-muted-foreground" />
<AshlarIcon icon={CalendarIcon} size={32} color="#4f46e5" aria-label="Calendar" />
```

`AshlarIcon` draws every icon in every style, so changing style is changing the
import. The package's root is Rounded Stroke; every style is
`@mittolabs/ashlar-icons-react/<style>` (`rounded-duotone`, `standard-stroke`,
`sharp-solid`, ...), with the same names in each, and `AshlarIcon` beside them:

```tsx
import { AshlarIcon, CalendarIcon } from '@mittolabs/ashlar-icons-react/sharp-solid';
```

An icon is an `<svg>`: it takes the text colour, is 24 pixels unless you size it, and
passes every other prop and `className` through, so utility classes such as `size-4`
work. Without an `aria-label` it is hidden from screen readers, as decoration should be.
Rendered, each icon carries the web font's classes, `ash ash-rounded-stroke ash-calendar`,
so every ashlaricons icon on a page, inline or font, answers to the same selectors.
Loading the stylesheet as well does not resize it.

Only the icons you import end up in your bundle.

## Two-layer styles

Duotone, Twotone and Bulk draw a faint layer at 40%. Give it a colour of its own with
`secondaryColor`, or from CSS with `--ash-secondary` (and `--ash-secondary-opacity`):

```tsx
import { AshlarIcon, CalendarIcon } from '@mittolabs/ashlar-icons-react/rounded-duotone';

<AshlarIcon icon={CalendarIcon} color="#4f46e5" secondaryColor="#c7d2fe" />
<AshlarIcon icon={CalendarIcon} className="text-primary [--ash-secondary:var(--color-primary)]" />
```

## Icons chosen at run time

An icon is plain data, so it can be kept in state, a list or a prop:

```tsx
import { AshlarIcon, HouseIcon, SettingsIcon, type AshlarIconData } from '@mittolabs/ashlar-icons-react';

const nav: { label: string; icon: AshlarIconData }[] = [
  { label: 'Home', icon: HouseIcon },
  { label: 'Settings', icon: SettingsIcon },
];

nav.map(({ label, icon }) => <AshlarIcon key={label} icon={icon} />);
```

## Licence

ISC, with the MIT notices of the designs it builds on. See `LICENSE`.
