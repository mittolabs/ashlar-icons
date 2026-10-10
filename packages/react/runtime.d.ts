import type { ForwardRefExoticComponent, RefAttributes, SVGProps } from 'react';
import type { AshlarIconData } from '@mittolabs/ashlar-icons-core';

export interface AshlarIconProps extends Omit<SVGProps<SVGSVGElement>, 'ref' | 'color'> {
  /** Width and height. Defaults to 24. A size class (size-4) overrides it. */
  size?: number | string;
  /** Defaults to currentColor, so the icon takes the text colour. */
  color?: string;
  /** The faint layer of a two-layer style. Defaults to var(--ash-secondary), else color. */
  secondaryColor?: string;
  /** The faint layer's opacity. Defaults to 1 with a secondaryColor, else var(--ash-secondary-opacity), else 0.4. */
  secondaryOpacity?: number | string;
}

export type AshlarIconComponent = ForwardRefExoticComponent<AshlarIconProps & RefAttributes<SVGSVGElement>>;

/** Draws any icon from @mittolabs/ashlar-icons-core. */
export declare const AshlarIcon: ForwardRefExoticComponent<
  AshlarIconProps & { icon: AshlarIconData } & RefAttributes<SVGSVGElement>
>;

/** Makes a named component that draws one icon, as every export of this package is. */
export declare function createAshlarIcon(name: string, icon: AshlarIconData): AshlarIconComponent;
