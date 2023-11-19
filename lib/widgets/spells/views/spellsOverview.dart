import 'dart:convert';
import 'dart:io';

import 'package:dndapp/widgets/spells/spell.dart';
import 'package:dndapp/widgets/spells/views/addSpell.dart';
import 'package:dndapp/widgets/spells/views/spellList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          toolbarHeight: 0,
          bottom: TabBar(
            dividerColor: Theme.of(context).dividerColor,
            indicatorColor: Theme.of(context).colorScheme.secondary,
            labelColor: Colors.white,
            // unselectedLabelColor: Theme.of(context).textTheme.,
            tabs: const [
              Tab(text: "Prepare spells"),
              Tab(text: "Manage spells"),
            ],
          ),
        ),
        body: TabBarView(children: [
          isLoading
              ? const Center(
                  child: Text('Loading...'),
                )
              : SpellList(spells),
          const AddSpell(),
        ]),
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
