import 'package:flutter/material.dart';

import '../../data/models/spell_model.dart';

class SpellDetailsTile extends StatelessWidget {
  final Spell data;

  const SpellDetailsTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Spell spell = data;

    return ExpansionTile(
      title: Text(spell.name),
      subtitle: Text(spell.type),
      children: [
        ListTile(
          title: Text("Effect: ${spell.effect}"),
        ),
      ],
    );
  }
}
