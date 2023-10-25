import 'package:dndapp/views/character.dart';
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
      home: const Scaffold(body: Character()),
    );
  }
}
