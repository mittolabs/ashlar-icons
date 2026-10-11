# @mittolabs/ashlar-icons

ashlaricons for any web page: 6,553 icons in ten styles, as one stylesheet with icon
fonts, and as SVG files. Browse them at [icons.ashlar.ke](https://icons.ashlar.ke).

For React, use [`@mittolabs/ashlar-icons-react`](https://www.npmjs.com/package/@mittolabs/ashlar-icons-react)
instead: it draws inline SVG and ships only the icons you use.

## The stylesheet

From a CDN:

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mittolabs/ashlar-icons@0.1.0/ashlar-icons.css">
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

Every icon in every style is `svg/<style>/<name>.svg`, drawn in `currentColor`:

```html
<img src="https://cdn.jsdelivr.net/npm/@mittolabs/ashlar-icons@0.1.0/svg/rounded-stroke/calendar.svg" alt="">
```

## Licence

ISC, with the MIT notices of the designs it builds on. See `LICENSE`.
