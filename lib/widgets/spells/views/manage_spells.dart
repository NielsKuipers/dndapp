import 'package:dndapp/widgets/spells/views/add_spell.dart';
import 'package:flutter/material.dart';

class ManageSpells extends StatelessWidget {
  const ManageSpells({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text("Add a custom spell"),
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) =>
                    const Dialog(child: AddSpell()),
              ),
              child: const Text('Add'),
            )
          ],
        )
      ],
    );
  }
}
