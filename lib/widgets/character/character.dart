import 'package:dndapp/widgets/spells/spell.dart';
import 'package:json_annotation/json_annotation.dart';
part 'character.g.dart';

@JsonSerializable()
class Character {
  String name;
  String race;
  @JsonKey(name: 'class')
  String currentClass;
  int level;
  List<Spell> spells;

  Character(this.name, this.race, this.currentClass, this.level, this.spells);

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
