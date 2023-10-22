import 'package:flutter/cupertino.dart';
import '../../../views/spells.dart';

class NavigateToSpells extends StatelessWidget {
  const NavigateToSpells({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          child: const Text('Spells'),
          onPressed: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const Spells(),
            ),
          ),
        ),
      ),
    );
  }
}
