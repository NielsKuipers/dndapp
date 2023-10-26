import 'package:dndapp/views/inventory.dart';
import 'package:dndapp/views/spellsView.dart';
import 'package:dndapp/views/stats.dart';
import 'package:flutter/material.dart';

class Character extends StatefulWidget {
  const Character({super.key});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  int currentIndex = 0;
  final views = [const Stats(), const SpellsView(), const Inventory()];
  final List<NavigationDestination> destionations = [
    const NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Stats'),
    const NavigationDestination(
        icon: Icon(Icons.local_fire_department), label: 'Spells'),
    const NavigationDestination(icon: Icon(Icons.backpack), label: 'Inventory')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currentIndex],
      bottomNavigationBar: NavigationBar(
        destinations: destionations,
        onDestinationSelected: (index) => setState(() => currentIndex = index),
        selectedIndex: currentIndex,
        indicatorColor: Colors.red,
      ),
    );
  }
}
