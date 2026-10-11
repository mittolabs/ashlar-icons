/** An icon a style draws exactly as an earlier style does: the same drawing, under its own style. */
export const same = (style, icon) => ({ name: icon.name, style, layers: icon.layers });
