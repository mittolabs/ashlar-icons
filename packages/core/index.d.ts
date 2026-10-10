/**
 * One icon in one style: its layers on a 24 by 24 grid, drawn bottom to top. Each is the
 * path data, and a 1 when it is the faint layer of a two-layer style (Duotone, Twotone,
 * Bulk), which is drawn at 40% or in its own colour.
 */
export type AshlarIconData = readonly (readonly [d: string] | readonly [d: string, faint: 1])[];

export type AshlarIconStyle =
  | 'rounded-stroke' | 'rounded-solid' | 'rounded-duotone' | 'rounded-twotone' | 'rounded-bulk'
  | 'standard-stroke' | 'standard-solid' | 'standard-duotone'
  | 'sharp-stroke' | 'sharp-solid';

/** The ten styles, each importable as `@mittolabs/ashlar-icons-core/<style>`. */
export declare const styles: readonly AshlarIconStyle[];

export * from './icons/rounded-stroke.js';
