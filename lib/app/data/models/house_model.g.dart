// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

House _$HouseFromJson(Map<String, dynamic> json) => House(
      id: json['id'] as String,
      name: json['name'] as String,
      houseColours: json['houseColours'] as String,
      founder: json['founder'] as String,
      animal: json['animal'] as String,
      element: json['element'] as String,
      ghost: json['ghost'] as String,
      commonRoom: json['commonRoom'] as String,
      heads: (json['heads'] as List<dynamic>)
          .map((e) => Head.fromJson(e as Map<String, dynamic>))
          .toList(),
      traits: (json['traits'] as List<dynamic>)
          .map((e) => Trait.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HouseToJson(House instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'houseColours': instance.houseColours,
      'founder': instance.founder,
      'animal': instance.animal,
      'element': instance.element,
      'ghost': instance.ghost,
      'commonRoom': instance.commonRoom,
      'heads': instance.heads,
      'traits': instance.traits,
    };

Head _$HeadFromJson(Map<String, dynamic> json) => Head(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$HeadToJson(Head instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

Trait _$TraitFromJson(Map<String, dynamic> json) => Trait(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$TraitToJson(Trait instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
