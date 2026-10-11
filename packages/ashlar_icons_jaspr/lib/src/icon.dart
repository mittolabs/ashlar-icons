import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// One icon in one style: its path data on a 24 by 24 grid and, for a two-layer
/// style (Duotone, Twotone, Bulk), its [faint] layer.
@immutable
class AshlarIconData {
  const AshlarIconData(
    String name,
    this.style,
    String d, {
    String? faint,
    bool faintOnTop = false,
  }) : _name = name,
       _d = d,
       _faint = faint,
       _faintOnTop = faintOnTop,
       _drawing = null;

  /// An icon [style] draws exactly as an earlier style does: the same drawing, under
  /// its own style.
  const AshlarIconData.same(this.style, AshlarIconData drawing)
    : _name = '',
      _d = '',
      _faint = null,
      _faintOnTop = false,
      _drawing = drawing;

  /// The style it is drawn in: rounded-stroke, sharp-solid.
  final String style;
  final String _name;
  final String _d;
  final String? _faint;
  final bool _faintOnTop;
  final AshlarIconData? _drawing;

  /// The icon's name in every package: calendar, a-arrow-down.
  String get name => _drawing?.name ?? _name;
  String get d => _drawing?.d ?? _d;

  /// The layer drawn at 40%, or in its own colour. Null for one-layer styles, and for
  /// icons with nothing to tint (an arrow has no body).
  String? get faint => _drawing == null ? _faint : _drawing.faint;

  /// Twotone draws its faint layer over the main one; Duotone and Bulk under it.
  bool get faintOnTop => _drawing?.faintOnTop ?? _faintOnTop;
}

/// Draws an [AshlarIconData] as inline SVG, so it renders on the server and needs
/// nothing loaded. It takes the text colour unless [color] is given. The faint layer
/// follows --ash-secondary and --ash-secondary-opacity, as the web font does. A
/// [secondaryColor] is drawn as given, at full strength unless [secondaryOpacity] says
/// otherwise, as Flutter's AshlarIcon does.
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
      // The web font's classes, so every ashlaricons icon on a page answers to the same
      // selectors (.ash, .ash-calendar), whichever package drew it.
      classes:
          'ash ash-${icon.style} ash-${icon.name}${classes == null ? '' : ' $classes'}',
      styles: styles,
      attributes: {
        'xmlns': 'http://www.w3.org/2000/svg',
        'width': '$size',
        'height': '$size',
        'viewBox': '0 0 24 24',
        'fill': fill,
        if (label == null)
          'aria-hidden': 'true'
        else ...{
          'role': 'img',
          'aria-label': label!,
        },
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
