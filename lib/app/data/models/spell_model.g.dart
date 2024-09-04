// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spell _$SpellFromJson(Map<String, dynamic> json) => Spell(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      effect: json['effect'] as String,
      incantation: json['incantation'] as String? ?? '',
    );

Map<String, dynamic> _$SpellToJson(Spell instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'effect': instance.effect,
      'incantation': instance.incantation,
    };
