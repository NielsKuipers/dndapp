import 'package:dndapp/widgets/navigation/navigationBar.dart';
import 'package:dndapp/widgets/navigation/routes/navigateToSpells.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoApp(title: 'DndApp', home: DndApp()));
}

class DndApp extends StatelessWidget {
  const DndApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: NavigationBar(title: 'Home'),
        child: NavigateToSpells(),
      ),
    );
  }
}
