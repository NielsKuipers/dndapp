import 'package:json_annotation/json_annotation.dart';
part 'spell.g.dart';

@JsonSerializable()
class Spell {
  String name;
  String description;
  String? upcast;

  String school;
  int level;
  @JsonKey(name: 'casting_time')
  String castingTime;
  String range;
  String components;
  String duration;

  @JsonKey(name: 'spell_lists')
  List<String> spellLists;

  Spell(this.name, this.description, this.school, this.level, this.castingTime,
      this.range, this.components, this.duration, this.spellLists,
      [this.upcast]);

  String getName() {
    return name;
  }

  int getLevel() {
    return level;
  }

  factory Spell.fromJson(Map<String, dynamic> json) => _$SpellFromJson(json);

  Map<String, dynamic> toJson() => _$SpellToJson(this);

  // factory Spell.fromJson(Map json) {
  //   name = json['name'];
  //   description = json['description'];
  //   upcast = json['upcast'];

  //   school = json['school'];
  //   level = json['level'];
  //   castingTime = json['casting_time'];
  //   range = json['range'];
  //   components = json['component'];
  //   duration = json['duration'];

  //   spellLists = json['spell_lists'];
  // }
}
