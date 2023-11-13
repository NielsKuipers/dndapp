import 'package:dndapp/theme.dart';
import 'package:dndapp/widgets/main/character.dart';
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
      theme: getTheme(),
      home: const Scaffold(body: Character()),
    );
  }
}
