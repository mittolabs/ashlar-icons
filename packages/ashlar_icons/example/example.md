```dart
import 'package:ashlar_icons/ashlar_icons.dart';
import 'package:flutter/widgets.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context) => const Row(children: [
        Icon(AshlarIconsRoundedStroke.house),
        Icon(AshlarIconsRoundedSolid.bell),
        AshlarLayeredIcon(AshlarIconsRoundedDuotone.calendar),
      ]);
}
```
