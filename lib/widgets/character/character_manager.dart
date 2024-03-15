import 'package:dndapp/file_system_manager.dart';
import 'package:dndapp/widgets/character/character.dart';

class CharacterManager {
  static final CharacterManager _instance = CharacterManager._internal();
  late List<Character> characters;
  late Character selectedCharacter;

  factory CharacterManager() {
    return _instance;
  }

  CharacterManager._internal() {
    _getCharacters();
  }

  void _getCharacters() async {
    var file = FileSystemManager().readFile("characters");
  }

  void pickCharacter(int id) {}
}
