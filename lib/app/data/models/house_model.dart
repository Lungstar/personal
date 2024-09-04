import 'package:json_annotation/json_annotation.dart';

part 'house_model.g.dart';

@JsonSerializable()
class House {
  final String id;
  final String name;
  final String houseColours;
  final String founder;
  final String animal;
  final String element;
  final String ghost;
  final String commonRoom;
  final List<Head> heads;
  final List<Trait> traits;

  House({
    required this.id,
    required this.name,
    required this.houseColours,
    required this.founder,
    required this.animal,
    required this.element,
    required this.ghost,
    required this.commonRoom,
    required this.heads,
    required this.traits,
  });

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);
  Map<String, dynamic> toJson() => _$HouseToJson(this);
}

@JsonSerializable()
class Head {
  final String id;
  final String firstName;
  final String lastName;

  Head({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Head.fromJson(Map<String, dynamic> json) => _$HeadFromJson(json);
  Map<String, dynamic> toJson() => _$HeadToJson(this);
}

@JsonSerializable()
class Trait {
  final String id;
  final String name;

  Trait({
    required this.id,
    required this.name,
  });

  factory Trait.fromJson(Map<String, dynamic> json) => _$TraitFromJson(json);
  Map<String, dynamic> toJson() => _$TraitToJson(this);
}
