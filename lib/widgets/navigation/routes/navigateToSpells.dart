import 'package:dndapp/widgets/navigation/routes/routeTo.dart';
import 'package:dndapp/widgets/navigation/routes/routeTypes.dart';
import 'package:flutter/material.dart';
import '../../../views/spells.dart';

class NavigateToSpells extends StatelessWidget {
  const NavigateToSpells({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton.tonal(
          onPressed: () => Navigator.of(context)
              .push(routeTo(const Spells(), RouteType.slideIn)),
          child: const Text('Spells'),
        ),
      ),
    );
  }
}
