import 'package:ashlar_icons_jaspr/ashlar_icons_jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

const accent = Color('#6a4cf0');

/// A page as a site would write it: every icon is the documented
/// `AshlarIcon(AshlarIcons<Style>.<name>)`, drawn as inline SVG.
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String page = 'Home';

  @override
  Component build(BuildContext context) {
    // Stroke for a link, Solid when it is the current page.
    Component link(String label, AshlarIconData icon, AshlarIconData current) => button(
      classes: page == label ? 'current' : null,
      onClick: () => setState(() => page = label),
      [AshlarIcon(page == label ? current : icon, size: 20), .text(label)],
    );
    Component item(AshlarIconData icon, String title, String sub) => li([
      AshlarIcon(icon),
      span([b([.text(title)]), .text(sub)]),
      const AshlarIcon(AshlarIconsRoundedStroke.chevronRight, classes: 'muted'),
    ]);

    return div(classes: 'shell', [
      aside([
        b(classes: 'brand', [.text('ashlaricons')]),
        link('Home', AshlarIconsRoundedStroke.house, AshlarIconsRoundedSolid.house),
        link('Cards', AshlarIconsRoundedStroke.creditCard, AshlarIconsRoundedSolid.creditCard),
        link('Chats', AshlarIconsRoundedStroke.messageCircle, AshlarIconsRoundedSolid.messageCircle),
        link('Profile', AshlarIconsRoundedStroke.user, AshlarIconsRoundedSolid.user),
      ]),
      main_([
        header([
          h1([.text(page)]),
          button(attributes: {'aria-label': 'Search'}, [const AshlarIcon(AshlarIconsRoundedStroke.search)]),
          button(attributes: {'aria-label': 'Notifications'}, [const AshlarIcon(AshlarIconsRoundedStroke.bell)]),
        ]),
        ul(classes: 'list', [
          item(AshlarIconsRoundedStroke.smartphoneCash, 'Send money', 'To a phone number'),
          item(AshlarIconsRoundedStroke.walletPlus, 'Top up', 'From your bank or card'),
          item(AshlarIconsRoundedStroke.minibus, 'Book a ride', 'Matatu and shuttle routes'),
        ]),
        h2([.text('Size and colour')]),
        div(classes: 'row', [
          const AshlarIcon(AshlarIconsRoundedStroke.calendar, size: 20),
          const AshlarIcon(AshlarIconsRoundedStroke.calendar),
          const AshlarIcon(AshlarIconsRoundedStroke.calendar, size: 32, color: accent),
          const AshlarIcon(AshlarIconsRoundedStroke.calendar, size: 40, color: Color('#0e7490'), label: 'Calendar'),
          // A size class works too: classes are passed to the svg.
          const AshlarIcon(AshlarIconsRoundedStroke.calendar, classes: 'big accent'),
        ]),
        h2([.text('Two layers: Duotone, Twotone, Bulk')]),
        div(classes: 'row accent', [
          const AshlarIcon(AshlarIconsRoundedDuotone.calendar, size: 40),
          const AshlarIcon(AshlarIconsRoundedTwotone.calendar, size: 40),
          const AshlarIcon(AshlarIconsRoundedBulk.calendar, size: 40),
          const AshlarIcon(AshlarIconsRoundedDuotone.calendar, size: 40, secondaryColor: Color('#f59e0b')),
          // Or from CSS, for every two-layer icon inside .amber.
          span(classes: 'amber', [const AshlarIcon(AshlarIconsRoundedBulk.creditCard, size: 40)]),
        ]),
        h2([.text('All ten styles')]),
        table([
          tbody([
            _style('Rounded Stroke', [AshlarIconsRoundedStroke.house, AshlarIconsRoundedStroke.calendar, AshlarIconsRoundedStroke.creditCard, AshlarIconsRoundedStroke.minibus]),
            _style('Rounded Solid', [AshlarIconsRoundedSolid.house, AshlarIconsRoundedSolid.calendar, AshlarIconsRoundedSolid.creditCard, AshlarIconsRoundedSolid.minibus]),
            _style('Rounded Duotone', [AshlarIconsRoundedDuotone.house, AshlarIconsRoundedDuotone.calendar, AshlarIconsRoundedDuotone.creditCard, AshlarIconsRoundedDuotone.minibus]),
            _style('Rounded Twotone', [AshlarIconsRoundedTwotone.house, AshlarIconsRoundedTwotone.calendar, AshlarIconsRoundedTwotone.creditCard, AshlarIconsRoundedTwotone.minibus]),
            _style('Rounded Bulk', [AshlarIconsRoundedBulk.house, AshlarIconsRoundedBulk.calendar, AshlarIconsRoundedBulk.creditCard, AshlarIconsRoundedBulk.minibus]),
            _style('Standard Stroke', [AshlarIconsStandardStroke.house, AshlarIconsStandardStroke.calendar, AshlarIconsStandardStroke.creditCard, AshlarIconsStandardStroke.minibus]),
            _style('Standard Solid', [AshlarIconsStandardSolid.house, AshlarIconsStandardSolid.calendar, AshlarIconsStandardSolid.creditCard, AshlarIconsStandardSolid.minibus]),
            _style('Standard Duotone', [AshlarIconsStandardDuotone.house, AshlarIconsStandardDuotone.calendar, AshlarIconsStandardDuotone.creditCard, AshlarIconsStandardDuotone.minibus]),
            _style('Sharp Stroke', [AshlarIconsSharpStroke.house, AshlarIconsSharpStroke.calendar, AshlarIconsSharpStroke.creditCard, AshlarIconsSharpStroke.minibus]),
            _style('Sharp Solid', [AshlarIconsSharpSolid.house, AshlarIconsSharpSolid.calendar, AshlarIconsSharpSolid.creditCard, AshlarIconsSharpSolid.minibus]),
          ]),
        ]),
      ]),
    ]);
  }

  static Component _style(String title, List<AshlarIconData> icons) => tr([
    th([.text(title)]),
    for (final icon in icons) td([AshlarIcon(icon, classes: 'accent')]),
  ]);
}
