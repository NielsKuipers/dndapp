import 'dart:convert';
import 'dart:io';

import 'package:dndapp/widgets/spells/spell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

// class Spells extends StatelessWidget {
//   const Spells({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       appBar: NavigationTopBar(title: 'Spells'),
//       body: Text('yo'),
//     );
//   }
// }

class SpellsView extends StatefulWidget {
  const SpellsView({super.key});

  @override
  State<SpellsView> createState() => _SpellsState();
}

class _SpellsState extends State<SpellsView> {
  bool isLoading = true;
  bool tileExpanded = false;
  late List<Spell> spells;

  @override
  void initState() {
    super.initState();
    getSpellsFromFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: Text('lol'),
            )
          : Center(
              child: Text('\$${spells[0].description}'),
            ),
    );
  }

  Future<void> getSpellsFromFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;

    // final file = File('resources/spells.json');
    // final data = await file.readAsString();
    final data = await rootBundle.loadString('assets/spells.json');
    List<dynamic> parsedJson = jsonDecode(data);

    // await Future.delayed(const Duration(seconds: 5));

    setState(() {
      isLoading = false;
    });

    spells = List<Spell>.from(
        parsedJson.map<Spell>((dynamic i) => Spell.fromJson(i)));
  }
}
