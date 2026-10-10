/** The ten styles, each importable as `@mittolabs/ashlar-icons-core/<style>`. */
export const styles = [
  'rounded-stroke', 'rounded-solid', 'rounded-duotone', 'rounded-twotone', 'rounded-bulk',
  'standard-stroke', 'standard-solid', 'standard-duotone',
  'sharp-stroke', 'sharp-solid',
];

// Rounded Stroke is the default style, as in every package; the others are <package>/<style>.
export * from './icons/rounded-stroke.js';
