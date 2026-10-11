import { createElement, forwardRef } from 'react';

const label = (props) => props['aria-label'] || props['aria-labelledby'] || props.title;

/**
 * Draws any ashlaricons icon, in any style, as inline SVG. The faint layer of a two-layer
 * style follows --ash-secondary and --ash-secondary-opacity, as the web font does. A
 * secondaryColor is drawn as given, at full strength unless secondaryOpacity says otherwise.
 */
export const AshlarIcon = forwardRef(function AshlarIcon(
  { icon, size = 24, color = 'currentColor', secondaryColor, secondaryOpacity, className, children, ...props },
  ref,
) {
  const faint = {
    fill: secondaryColor ?? `var(--ash-secondary, ${color})`,
    // A colour given here is drawn as given, as Flutter does; the CSS variable keeps the 40%.
    opacity: secondaryOpacity ?? (secondaryColor ? 1 : 'var(--ash-secondary-opacity, 0.4)'),
  };
  return createElement(
    'svg',
    {
      ref,
      xmlns: 'http://www.w3.org/2000/svg',
      width: size,
      height: size,
      viewBox: '0 0 24 24',
      fill: color,
      'aria-hidden': label(props) ? undefined : true,
      role: label(props) ? 'img' : undefined,
      // The web font's classes, so every ashlaricons icon on a page answers to the same
      // selectors (.ash, .ash-calendar), whichever package drew it.
      className: ['ash', `ash-${icon.style}`, `ash-${icon.name}`, className].filter(Boolean).join(' '),
      ...props,
    },
    ...icon.layers.map(([d, isFaint], i) => createElement('path', isFaint ? { key: i, d, style: faint } : { key: i, d })),
    children,
  );
});
