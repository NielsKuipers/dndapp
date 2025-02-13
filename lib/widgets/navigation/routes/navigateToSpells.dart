import 'package:dndapp/widgets/navigation/routes/routeTo.dart';
import 'package:dndapp/widgets/navigation/routes/transitionType.dart';
import 'package:flutter/material.dart';
import '../../spells/views/spells_overview.dart';

class NavigateToSpells extends StatelessWidget {
  const NavigateToSpells({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton.tonal(
          onPressed: () =>
              routeTo(const SpellsView(), TransitionType.slideIn, context),
          child: const Text('Spells'),
        ),
      ),
    );
  }
}
