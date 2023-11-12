// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spell _$SpellFromJson(Map<String, dynamic> json) => Spell(
      json['name'] as String,
      json['description'] as String,
      json['school'] as String,
      json['level'] as String,
      json['casting_time'] as String,
      json['range'] as String,
      json['components'] as String,
      json['duration'] as String,
      (json['spell_lists'] as List<dynamic>).map((e) => e as String).toList(),
      json['upcast'] as String?,
      json['components_extra'] as String?,
      json['casting_time_extra'] as String?,
    );

Map<String, dynamic> _$SpellToJson(Spell instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'upcast': instance.upcast,
      'school': instance.school,
      'level': instance.level,
      'casting_time': instance.castingTime,
      'casting_time_extra': instance.castingTimeExtra,
      'range': instance.range,
      'components': instance.components,
      'components_extra': instance.componentExtra,
      'duration': instance.duration,
      'spell_lists': instance.spellLists,
    };
