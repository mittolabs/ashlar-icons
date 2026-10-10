```dart
import 'package:ashlar_icons_jaspr/ashlar_icons_jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Toolbar extends StatelessComponent {
  const Toolbar({super.key});

  @override
  Component build(BuildContext context) => nav([
    AshlarIcon(AshlarIconsRoundedStroke.house, label: 'Home'),
    AshlarIcon(AshlarIconsRoundedSolid.bell, label: 'Notifications'),
    AshlarIcon(AshlarIconsRoundedDuotone.calendar, label: 'Calendar'),
  ]);
}
```
