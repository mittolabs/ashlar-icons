import { createElement as h, forwardRef, useId } from 'react';

/**
 * Draws a flag from @mittolabs/ashlar-icons-react/flags (4:3, in a rectangle with rounded
 * corners) or /flags/circle (1:1, in a circle), size pixels tall, with a faint edge so a
 * white flag shows on white.
 */
export const AshlarFlag = forwardRef(function AshlarFlag({ flag, size = 24, border = true, className, ...props }, ref) {
  const uid = useId().replace(/:/g, '');
  const { width: w, height: hh, ops } = flag;
  const circle = flag.shape === 'circle';
  const label = props['aria-label'] || props['aria-labelledby'] || props.title;
  // The ops nest: a clip holds everything up to its restore.
  const defs = [], root = [], stack = [root];
  ops.forEach((op, i) => {
    if (op[0] === 'clip') {
      const id = `${uid}c${i}`;
      defs.push(h('clipPath', { key: id, id }, h('path', { d: op[1], clipRule: op[2] ? 'evenodd' : undefined })));
      const children = [];
      stack.at(-1).push({ id, children });
      stack.push(children);
    } else if (op[0] === 'restore') {
      if (stack.length > 1) stack.pop();
    } else {
      const [, d, fill, rule, fo, stroke, sw, cap, join, miter, so, m] = op;
      stack.at(-1).push(h('path', {
        key: i, d, fill: fill ?? 'none', fillRule: rule ? 'evenodd' : undefined, fillOpacity: fo !== 1 ? fo : undefined,
        stroke: stroke ?? undefined, strokeWidth: stroke ? sw : undefined, strokeOpacity: stroke && so !== 1 ? so : undefined,
        strokeLinecap: stroke && cap && cap !== 'butt' ? cap : undefined, strokeLinejoin: stroke && join && join !== 'miter' ? join : undefined,
        strokeMiterlimit: stroke && miter != null && miter !== 4 ? miter : undefined, transform: m ? `matrix(${m.join(' ')})` : undefined,
      }));
    }
  });
  const render = (nodes) => nodes.map((n) => (n.children ? h('g', { key: n.id, clipPath: `url(#${n.id})` }, render(n.children)) : n));
  const e = hh / size; // one pixel on the flag's grid
  return h(
    'svg',
    {
      ref, xmlns: 'http://www.w3.org/2000/svg', viewBox: `0 0 ${w} ${hh}`, width: (size * w) / hh, height: size,
      'aria-hidden': label ? undefined : true, role: label ? 'img' : undefined,
      className: ['ash-flag', `ash-flag-${flag.code.toLowerCase()}`, className].filter(Boolean).join(' '),
      ...props,
    },
    h('defs', null,
      h('clipPath', { id: `${uid}s` }, circle ? h('circle', { cx: w / 2, cy: hh / 2, r: w / 2 }) : h('rect', { width: w, height: hh, rx: hh * 0.125 })),
      ...defs),
    h('g', { clipPath: `url(#${uid}s)` }, render(root)),
    border
      ? circle
        ? h('circle', { cx: w / 2, cy: hh / 2, r: w / 2 - e / 2, fill: 'none', stroke: 'rgb(0 0 0 / 12%)', strokeWidth: e })
        : h('rect', { x: e / 2, y: e / 2, width: w - e, height: hh - e, rx: hh * 0.125, fill: 'none', stroke: 'rgb(0 0 0 / 12%)', strokeWidth: e })
      : null,
  );
});
