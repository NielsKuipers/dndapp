import 'package:dndapp/widgets/spells/spell.dart';
import 'package:flutter/material.dart';

List<Item> spells = [];

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item(
      {required this.expandedValue,
      required this.headerValue,
      this.isExpanded = true});
}

class SpellList extends StatefulWidget {
  SpellList(List<Spell> spellData, {super.key}) {
    for (Spell spell in spellData) {
      String header = "Level ${spell.level}";

      if (!spells.any((item) => item.headerValue == header)) {
        spells.add(Item(expandedValue: spell.name, headerValue: header));
      }
    }
  }

  @override
  State<SpellList> createState() => _SpellListState();
}

class _SpellListState extends State<SpellList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    // Reverse list so spell level is ascending instead of descending
    List<Item> spellsReversed = spells.reversed.toList();

    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() => spellsReversed[index].isExpanded =
            !spellsReversed[index].isExpanded);
      },
      children: spellsReversed.map((Item item) {
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) =>
                ListTile(title: Text(item.headerValue)),
            body: ListTile(title: Text(item.expandedValue)),
            isExpanded: item.isExpanded);
      }).toList(),
    );
  }
}
