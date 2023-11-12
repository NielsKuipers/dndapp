import 'package:json_annotation/json_annotation.dart';
part 'spell.g.dart';

@JsonSerializable()
class Spell {
  String name;
  String description;
  String? upcast;

  String school;
  String level;
  @JsonKey(name: 'casting_time')
  String castingTime;
  @JsonKey(name: 'casting_time_extra')
  String? castingTimeExtra;
  String range;
  String components;
  @JsonKey(name: 'components_extra')
  String? componentExtra;
  String duration;

  @JsonKey(name: 'spell_lists')
  List<String> spellLists;

  Spell(this.name, this.description, this.school, this.level, this.castingTime,
      this.range, this.components, this.duration, this.spellLists,
      [this.upcast, this.componentExtra, this.castingTimeExtra]);

  factory Spell.fromJson(Map<String, dynamic> json) => _$SpellFromJson(json);

  Map<String, dynamic> toJson() => _$SpellToJson(this);
}
