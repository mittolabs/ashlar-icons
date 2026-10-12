# @mittolabs/ashlar-icons

ashlaricons for any web page: 6,791 icons in ten styles, as one stylesheet with icon
fonts. Browse them at [icons.ashlar.ke](https://icons.ashlar.ke).

For React, use [`@mittolabs/ashlar-icons-react`](https://www.npmjs.com/package/@mittolabs/ashlar-icons-react)
instead: it draws inline SVG and ships only the icons you use.

## The stylesheet

From a CDN:

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mittolabs/ashlar-icons@0.3/ashlar-icons.css">
```

or installed, `npm install @mittolabs/ashlar-icons`, then
`import '@mittolabs/ashlar-icons';` in a bundler that handles CSS.

```html
<i class="ash ash-rounded-stroke ash-calendar"></i>
<i class="ash ash-sharp-solid ash-calendar"></i>
<i class="ash ash-rounded-duotone ash-calendar"></i>
```

Icons take the text colour and font size. For Duotone, Twotone and Bulk, set
`--ash-secondary` to colour the faint layer and `--ash-secondary-opacity` to change its
strength:

```css
.brand-icon {
  color: #4f46e5;
  font-size: 32px;
  --ash-secondary: #c7d2fe;
  --ash-secondary-opacity: 1;
}
```

## SVG files

Every icon in every style is at `https://icons.ashlar.ke/svg/<style>/<name>.svg`, drawn in
`currentColor`:

```html
<img src="https://icons.ashlar.ke/svg/rounded-stroke/calendar.svg" alt="">
```

[icons.ashlar.ke](https://icons.ashlar.ke/icons) also downloads any icon as SVG or PNG in your
colours. This package carries the stylesheet and fonts only; for icons drawn from code, use
the React or Jaspr package.

## Flags

271 flags of countries and regions, in a second stylesheet:

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mittolabs/ashlar-icons@0.3/ashlar-flags.css">

<span class="ash-flag ash-flag-ke"></span>                  <!-- 4:3, 1em tall -->
<span class="ash-flag ash-flag-circle ash-flag-ke"></span>  <!-- in a circle -->
```

The flags are also files: `flags/rect/<code>.svg` and `flags/circle/<code>.svg`.

## Countries and continents

Outlines of 231 countries and territories and 7 continents, as icons in all ten styles,
named `country-<name>` and `continent-<name>`: `<i class="ash ash-rounded-solid ash-country-kenya"></i>`.

## Licence

ISC, with the MIT notices of the designs it builds on in `NOTICE`. See `LICENSE`.
