import 'package:dndapp/widgets/navigation/navigationTopBar.dart';
import 'package:dndapp/widgets/navigation/routes/navigateToSpells.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: 'DndApp', home: DndApp()));
}

class DndApp extends StatelessWidget {
  const DndApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const Scaffold(
        appBar: NavigationTopBar(title: 'Home'),
        body: Center(
          child: NavigateToSpells(),
        ),
      ),
    );
  }
}
