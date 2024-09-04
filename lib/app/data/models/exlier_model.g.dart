// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elixir_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Elixir _$ElixirFromJson(Map<String, dynamic> json) => Elixir(
      id: json['id'] as String,
      name: json['name'] as String,
      effect: json['effect'] as String? ?? '',
      sideEffects: json['sideEffects'] as String? ?? '',
      characteristics: json['characteristics'] as String? ?? '',
      time: json['time'] as String? ?? '',
      difficulty: json['difficulty'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      inventors: (json['inventors'] as List<dynamic>)
          .map((e) => Inventor.fromJson(e as Map<String, dynamic>))
          .toList(),
      manufacturer: json['manufacturer'] as String? ?? '',
    );

Map<String, dynamic> _$ElixirToJson(Elixir instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'effect': instance.effect,
      'sideEffects': instance.sideEffects,
      'characteristics': instance.characteristics,
      'time': instance.time,
      'difficulty': instance.difficulty,
      'ingredients': instance.ingredients,
      'inventors': instance.inventors,
      'manufacturer': instance.manufacturer,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Inventor _$InventorFromJson(Map<String, dynamic> json) => Inventor(
      id: json['id'] as String,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
    );

Map<String, dynamic> _$InventorToJson(Inventor instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
