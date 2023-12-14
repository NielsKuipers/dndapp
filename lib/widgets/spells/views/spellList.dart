// ignore_for_file: curly_braces_in_flow_control_structures
import 'dart:collection';

import 'package:dndapp/widgets/navigation/routes/routeTo.dart';
import 'package:dndapp/widgets/navigation/routes/transitionType.dart';
import 'package:dndapp/widgets/spells/spell.dart';
import 'package:dndapp/widgets/spells/views/spellDetail.dart';
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
    if (spells.isEmpty)
      return Container(
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No spells added yet.'),
            Text('Go to manage spells to add some!')
          ],
        ),
      );

    void prepareSpell(Spell spell) {
      setState(() {
        spell.prepared = !spell.prepared;
      });
    }

    final slivers = <SliverList>[
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            String key = spells.keys.elementAt(index);

            return ExpansionTile(
              title: Text(key),
              children: [
                for (var spell in spells[key]!)
                  ListTile(
                    title: Text(spell.name),
                    trailing: spell.prepared == false
                        ? OutlinedButton(
                            onPressed: () {
                              prepareSpell(spell);
                            },
                            child: const Text('Prepare'))
                        : FilledButton(
                            onPressed: () {
                              prepareSpell(spell);
                            },
                            child: const Text('Unprepare')),
                    onTap: () => routeTo(
                        SpellDetail(spell), TransitionType.slideIn, context),
                  )
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
