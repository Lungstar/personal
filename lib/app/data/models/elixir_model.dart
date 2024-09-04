import 'package:json_annotation/json_annotation.dart';

part 'exlier_model.g.dart';

@JsonSerializable()
class Elixir {
  final String id;
  final String name;
  final String? effect;
  final String? sideEffects;
  final String? characteristics;
  final String? time;
  final String difficulty;
  final List<Ingredient> ingredients;
  final List<Inventor> inventors;
  final String? manufacturer;

  Elixir({
    required this.id,
    required this.name,
    this.effect = '',
    this.sideEffects = '',
    this.characteristics = '',
    this.time = '',
    required this.difficulty,
    required this.ingredients,
    required this.inventors,
    this.manufacturer = '',
  });

  factory Elixir.fromJson(Map<String, dynamic> json) => _$ElixirFromJson(json);
  Map<String, dynamic> toJson() => _$ElixirToJson(this);
}

@JsonSerializable()
class Ingredient {
  final String id;
  final String name;

  Ingredient({
    required this.id,
    required this.name,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

@JsonSerializable()
class Inventor {
  final String id;
  final String? firstName;
  final String? lastName;

  Inventor({
    required this.id,
     this.firstName = '',
     this.lastName = '',
  });

  factory Inventor.fromJson(Map<String, dynamic> json) => _$InventorFromJson(json);
  Map<String, dynamic> toJson() => _$InventorToJson(this);
}