// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      json['name'] as String,
      json['race'] as String,
      json['class'] as String,
      json['level'] as int,
      (json['spells'] as List<dynamic>)
          .map((e) => Spell.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'race': instance.race,
      'class': instance.currentClass,
      'level': instance.level,
      'spells': instance.spells,
    };
