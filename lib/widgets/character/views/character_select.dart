import 'package:dndapp/widgets/character/character.dart';
import 'package:dndapp/widgets/navigation/loading_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CharacterSelect extends StatefulWidget {
  const CharacterSelect({super.key});

  @override
  State<CharacterSelect> createState() => _CharacterSelectState();
}

class _CharacterSelectState extends State<CharacterSelect> {
  bool isLoading = true;
  late List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingScreen()
        : Scaffold(
            body: Column(children: [
              
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () => createCharacter(),
                        child: const Text("Create new character"))
                  ],
                ),
              )
            ]),
          );
  }

  void createCharacter() {}
}
