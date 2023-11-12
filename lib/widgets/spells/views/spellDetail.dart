// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:dndapp/widgets/spells/spell.dart';
import 'package:flutter/material.dart';

class SpellDetail extends StatelessWidget {
  final Spell spell;
  late String compAsterix = '*';

  SpellDetail(this.spell, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(spell.name),
        centerTitle: true,
      ),
      body: ListView(children: [
        buildStatBlock(spell),
        Divider(
          height: 50,
          color: Theme.of(context).dividerColor,
          indent: 25,
          endIndent: 25,
          thickness: 3,
        ),
        buildTextBlock(spell),
        buildClassBlock(spell.spellLists)
      ]),
    );
  }

  Container buildStatBlock(Spell spell) {
    if (spell.castingTimeExtra != null && spell.componentExtra != null)
      compAsterix = '**';

    String castingTime =
        spell.castingTimeExtra == null ? 'Casting time' : 'Casting time*';
    String components =
        spell.componentExtra == null ? 'Components' : 'Components$compAsterix';

    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(children: [
        buildStatRow(['Level', castingTime], [spell.level, spell.castingTime]),
        const SizedBox(height: 25),
        buildStatRow(
            ['Range/area', components], [spell.range, spell.components]),
        const SizedBox(height: 25),
        buildStatRow(['Duration', 'School'], [spell.duration, spell.school]),
      ]),
    );
  }

  Row buildStatRow(List<String> titles, List<String> subtitles) {
    List<Expanded> stats = [];

    for (var i = 0; i < titles.length; i++) {
      stats.add(Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titles[i],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitles[i],
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            )
          ],
        ),
      ));
    }

    return Row(
      children: stats,
    );
  }

  //builds the lower half of the page with huge text such as description
  Container buildTextBlock(Spell spell) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(children: [
        Row(
          children: [
            Flexible(
                child: Text(
              spell.description,
              textAlign: TextAlign.justify,
            ))
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        if (spell.upcast != null)
          Row(
            children: [
              // Flexible(child: Text('At Higher Levels: ${spell.upcast}'))
              Flexible(
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text: 'At higher levels: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: spell.upcast,
                          style: const TextStyle(fontWeight: FontWeight.normal))
                    ],
                  ),
                ),
              )
            ],
          ),
        const SizedBox(
          height: 25,
        ),
        Column(children: [
          if (spell.castingTimeExtra != null)
            Row(children: [
              Text(
                '* - ${spell.castingTimeExtra ?? ''}',
                style:
                    const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
              )
            ]),
          if (spell.componentExtra != null)
            Row(children: [
              Text(
                '$compAsterix - ${spell.componentExtra ?? ''}',
                style:
                    const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
              )
            ]),
        ])
      ]),
    );
  }

  Container buildClassBlock(List<String> classes) {
    String classString = 'Classes: ';
    for (var i = 0; i < classes.length; i++) {
      classString += '${classes[i]}, ';
    }

    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Row(children: [Text(classString)]),
    );
  }
}
