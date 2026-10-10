import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// One icon in one style: its path data on a 24 by 24 grid and, for a two-layer
/// style (Duotone, Twotone, Bulk), its [faint] layer.
@immutable
class AshlarIconData {
  const AshlarIconData(this.name, this.d, {this.faint, this.faintOnTop = false});

  /// The icon's name in every package: calendar, a-arrow-down.
  final String name;
  final String d;

  /// The layer drawn at 40%, or in its own colour. Null for one-layer styles, and for
  /// icons with nothing to tint (an arrow has no body).
  final String? faint;

  /// Twotone draws its faint layer over the main one; Duotone and Bulk under it.
  final bool faintOnTop;
}

/// Draws an [AshlarIconData] as inline SVG, so it renders on the server and needs
/// nothing loaded. It takes the text colour unless [color] is given. The faint layer
/// follows --ash-secondary and --ash-secondary-opacity, as the web font does. A
/// [secondaryColor] is drawn as given, at full strength unless [secondaryOpacity] says
/// otherwise, as Flutter's AshlarLayeredIcon does.
class AshlarIcon extends StatelessComponent {
  const AshlarIcon(
    this.icon, {
    this.size = 24,
    this.color,
    this.secondaryColor,
    this.secondaryOpacity,
    this.label,
    this.classes,
    this.styles,
    this.attributes,
    super.key,
  });

  final AshlarIconData icon;

  /// Width and height in pixels. A class that sizes it (size-4) overrides it.
  final num size;
  final Color? color;
  final Color? secondaryColor;
  final double? secondaryOpacity;

  /// Read out by screen readers. Without one the icon is decorative and hidden from them.
  final String? label;
  final String? classes;
  final Styles? styles;
  final Map<String, String>? attributes;

  @override
  Component build(BuildContext context) {
    final fill = color?.value ?? 'currentColor';
    final main = Component.element(tag: 'path', attributes: {'d': icon.d});
    final faintD = icon.faint;
    final faint = faintD == null
        ? null
        : Component.element(
            tag: 'path',
            attributes: {
              'd': faintD,
              'style':
                  'fill:${secondaryColor?.value ?? 'var(--ash-secondary,$fill)'};'
                  'opacity:${secondaryOpacity ?? (secondaryColor != null ? 1 : 'var(--ash-secondary-opacity,0.4)')}',
            },
          );
    return Component.element(
      tag: 'svg',
      // Names the set and the icon, as other sets do, so a page shows where an icon came from.
      classes: 'ashlar-icon ashlar-icon-${icon.name}${classes == null ? '' : ' $classes'}',
      styles: styles,
      attributes: {
        'xmlns': 'http://www.w3.org/2000/svg',
        'width': '$size',
        'height': '$size',
        'viewBox': '0 0 24 24',
        'fill': fill,
        if (label == null) 'aria-hidden': 'true' else ...{'role': 'img', 'aria-label': label!},
        ...?attributes,
      },
      children: [
        if (faint != null && !icon.faintOnTop) faint,
        main,
        if (faint != null && icon.faintOnTop) faint,
      ],
    );
  }
}
