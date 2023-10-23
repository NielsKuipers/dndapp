import 'package:flutter/material.dart';
import '../../../views/spells.dart';

class NavigateToSpells extends StatelessWidget {
  const NavigateToSpells({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton.tonal(
          child: const Text('Spells'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Spells(),
            ),
          ),
        ),
      ),
    );
  }
}
