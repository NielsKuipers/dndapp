import 'package:dndapp/widgets/navigation/navigationTopBar.dart';
import 'package:flutter/material.dart';

class Spells extends StatelessWidget {
  const Spells({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NavigationTopBar(title: 'Spells'),
      body: Text('yo'),
    );
  }
}
