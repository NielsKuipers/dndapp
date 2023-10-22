import 'package:flutter/cupertino.dart';
import 'package:dndapp/widgets/navigation/navigationBar.dart';

class Spells extends StatelessWidget {
  const Spells({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const NavigationBar(title: 'Spells'),
      child: Center(
        child: CupertinoButton(
          child: const Text('Go back'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
