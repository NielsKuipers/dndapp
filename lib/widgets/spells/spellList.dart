// ignore_for_file: curly_braces_in_flow_control_structures
import 'dart:collection';

import 'package:dndapp/widgets/spells/spell.dart';
import 'package:flutter/material.dart';

late SplayTreeMap<String, List<Spell>> spells;

class SpellList extends StatefulWidget {
  SpellList(List<Spell> spellData, {super.key}) {
    spells = SplayTreeMap<String, List<Spell>>();

    for (Spell spell in spellData) {
      if (spells.containsKey(spell.level))
        spells[spell.level]?.add(spell);
      else
        spells[spell.level] = [spell];
    }
  }

  @override
  State<SpellList> createState() => _SpellListState();
}

class _SpellListState extends State<SpellList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: listOfSpells());
  }

  Widget listOfSpells() {
    final slivers = <SliverList>[
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            String key = spells.keys.elementAt(index);

            return ExpansionTile(
              title: Text(key),
              children: [
                for (var spell in spells[key]!)
                  ListTile(title: Text(spell.name))
              ],
            );
          },
          childCount: spells.length,
        ),
      ),
    ];

    return CustomScrollView(
      slivers: slivers,
    );
  }
}
