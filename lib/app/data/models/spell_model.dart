import 'package:json_annotation/json_annotation.dart';

part 'spell_model.g.dart';

@JsonSerializable()
class   Spell {
  final String id;
  final String name;
  final String type;
  final String effect;
  final String? incantation;

  Spell({
    required this.id,
    required this.name,
    required this.type,
    required this.effect,
    this.incantation = '',
  });

  factory Spell.fromJson(Map<String, dynamic> json) => _$SpellFromJson(json);
  Map<String, dynamic> toJson() => _$SpellToJson(this);
}
