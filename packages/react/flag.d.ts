import type { ForwardRefExoticComponent, RefAttributes, SVGProps } from 'react';
import type { AshlarFlagData } from '@mittolabs/ashlar-icons-core/flags';

export interface AshlarFlagProps extends Omit<SVGProps<SVGSVGElement>, 'ref'> {
  /** The flag: KE from '@mittolabs/ashlar-icons-react/flags' or '/flags/circle'. */
  flag: AshlarFlagData;
  /** Height in pixels. Defaults to 24; a rectangle is a third wider. */
  size?: number;
  /** A faint edge, so a white flag shows on white. Defaults to true. */
  border?: boolean;
}

/** Draws a flag as inline SVG. */
export declare const AshlarFlag: ForwardRefExoticComponent<AshlarFlagProps & RefAttributes<SVGSVGElement>>;
