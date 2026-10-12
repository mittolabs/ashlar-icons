import 'package:ashlar_icons/ashlar_icons.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ExampleApp());

const accent = Color(0xFF6A4CF0);

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'ashlaricons for Flutter',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: accent, useMaterial3: true),
    home: const HomeScreen(),
  );
}

/// A screen as an app would write it: every icon is the documented
/// `AshlarIcon(AshlarIcons<Style>.<name>)`, or Flutter's own `Icon`.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ashlaricons'),
        actions: [
          IconButton(onPressed: () {}, tooltip: 'Search', icon: const AshlarIcon(AshlarIconsRoundedStroke.search)),
          // Every icon is an IconData, so Flutter's Icon draws the one-layer styles too.
          IconButton(onPressed: () {}, tooltip: 'Notifications', icon: const Icon(AshlarIconsRoundedStroke.bell)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          const ListTile(
            leading: AshlarIcon(AshlarIconsRoundedStroke.smartphoneCash),
            title: Text('Send money'),
            subtitle: Text('To a phone number'),
            trailing: AshlarIcon(AshlarIconsRoundedStroke.chevronRight),
          ),
          const ListTile(
            leading: AshlarIcon(AshlarIconsRoundedStroke.walletPlus),
            title: Text('Top up'),
            subtitle: Text('From your bank or card'),
            trailing: AshlarIcon(AshlarIconsRoundedStroke.chevronRight),
          ),
          const ListTile(
            leading: AshlarIcon(AshlarIconsRoundedStroke.minibus),
            title: Text('Book a ride'),
            subtitle: Text('Matatu and shuttle routes'),
            trailing: AshlarIcon(AshlarIconsRoundedStroke.chevronRight),
          ),
          const Divider(height: 32),
          _Section('Size and colour', text),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 16,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                AshlarIcon(AshlarIconsRoundedStroke.calendar, size: 20),
                AshlarIcon(AshlarIconsRoundedStroke.calendar),
                AshlarIcon(AshlarIconsRoundedStroke.calendar, size: 32, color: accent),
                AshlarIcon(AshlarIconsRoundedStroke.calendar, size: 40, color: Color(0xFF0E7490), semanticLabel: 'Calendar'),
              ],
            ),
          ),
          _Section('Two layers: Duotone, Twotone, Bulk', text),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 16,
              children: [
                // The faint layer is the colour at 40%...
                AshlarIcon(AshlarIconsRoundedDuotone.calendar, size: 40, color: accent),
                AshlarIcon(AshlarIconsRoundedTwotone.calendar, size: 40, color: accent),
                AshlarIcon(AshlarIconsRoundedBulk.calendar, size: 40, color: accent),
                // ...or a colour of its own, drawn as given.
                AshlarIcon(AshlarIconsRoundedDuotone.calendar, size: 40, color: accent, secondaryColor: Color(0xFFF59E0B)),
                AshlarIcon(AshlarIconsRoundedBulk.creditCard, size: 40, color: accent, secondaryColor: Color(0xFFF59E0B)),
              ],
            ),
          ),
          _Section('All ten styles', text),
          const _StyleRow('Rounded Stroke', [AshlarIconsRoundedStroke.house, AshlarIconsRoundedStroke.calendar, AshlarIconsRoundedStroke.creditCard, AshlarIconsRoundedStroke.minibus]),
          const _StyleRow('Rounded Solid', [AshlarIconsRoundedSolid.house, AshlarIconsRoundedSolid.calendar, AshlarIconsRoundedSolid.creditCard, AshlarIconsRoundedSolid.minibus]),
          const _StyleRow('Rounded Duotone', [AshlarIconsRoundedDuotone.house, AshlarIconsRoundedDuotone.calendar, AshlarIconsRoundedDuotone.creditCard, AshlarIconsRoundedDuotone.minibus]),
          const _StyleRow('Rounded Twotone', [AshlarIconsRoundedTwotone.house, AshlarIconsRoundedTwotone.calendar, AshlarIconsRoundedTwotone.creditCard, AshlarIconsRoundedTwotone.minibus]),
          const _StyleRow('Rounded Bulk', [AshlarIconsRoundedBulk.house, AshlarIconsRoundedBulk.calendar, AshlarIconsRoundedBulk.creditCard, AshlarIconsRoundedBulk.minibus]),
          const _StyleRow('Standard Stroke', [AshlarIconsStandardStroke.house, AshlarIconsStandardStroke.calendar, AshlarIconsStandardStroke.creditCard, AshlarIconsStandardStroke.minibus]),
          const _StyleRow('Standard Solid', [AshlarIconsStandardSolid.house, AshlarIconsStandardSolid.calendar, AshlarIconsStandardSolid.creditCard, AshlarIconsStandardSolid.minibus]),
          const _StyleRow('Standard Duotone', [AshlarIconsStandardDuotone.house, AshlarIconsStandardDuotone.calendar, AshlarIconsStandardDuotone.creditCard, AshlarIconsStandardDuotone.minibus]),
          const _StyleRow('Sharp Stroke', [AshlarIconsSharpStroke.house, AshlarIconsSharpStroke.calendar, AshlarIconsSharpStroke.creditCard, AshlarIconsSharpStroke.minibus]),
          const _StyleRow('Sharp Solid', [AshlarIconsSharpSolid.house, AshlarIconsSharpSolid.calendar, AshlarIconsSharpSolid.creditCard, AshlarIconsSharpSolid.minibus]),
        ],
      ),
      // The usual pattern: Stroke for a tab, Solid when it is selected. The bar's
      // IconTheme sizes and colours both.
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (i) => setState(() => _tab = i),
        destinations: const [
          NavigationDestination(
            icon: AshlarIcon(AshlarIconsRoundedStroke.house),
            selectedIcon: AshlarIcon(AshlarIconsRoundedSolid.house),
            label: 'Home',
          ),
          NavigationDestination(
            icon: AshlarIcon(AshlarIconsRoundedStroke.creditCard),
            selectedIcon: AshlarIcon(AshlarIconsRoundedSolid.creditCard),
            label: 'Cards',
          ),
          NavigationDestination(
            icon: AshlarIcon(AshlarIconsRoundedStroke.messageCircle),
            selectedIcon: AshlarIcon(AshlarIconsRoundedSolid.messageCircle),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: AshlarIcon(AshlarIconsRoundedStroke.user),
            selectedIcon: AshlarIcon(AshlarIconsRoundedSolid.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section(this.title, this.text);

  final String title;
  final TextTheme text;

  @override
  Widget build(BuildContext context) =>
      Padding(padding: const EdgeInsets.fromLTRB(16, 20, 16, 12), child: Text(title, style: text.titleSmall));
}

class _StyleRow extends StatelessWidget {
  const _StyleRow(this.title, this.icons);

  final String title;
  final List<IconData> icons;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    child: Row(
      children: [
        SizedBox(width: 140, child: Text(title)),
        for (final icon in icons) Padding(padding: const EdgeInsets.only(right: 16), child: AshlarIcon(icon, color: accent)),
      ],
    ),
  );
}
