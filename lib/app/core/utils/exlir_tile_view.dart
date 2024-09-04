import 'package:flutter/material.dart';
import 'package:solution/app/data/models/elixir_model.dart';

class ExlirDetailsTile extends StatelessWidget {
  final Elixir data;

  const ExlirDetailsTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Elixir elixir = data;

    return ExpansionTile(
      title: Text(elixir.name),
      subtitle: Text(elixir.effect ?? ''),
      children: [
        ListTile(title: Text("Effect: ${elixir.effect}")),
        ListTile(title: Text("Side Effects: ${elixir.sideEffects}")),
        ListTile(title: Text("Characteristics: ${elixir.characteristics}")),
        ListTile(title: Text("Brewing Time: ${elixir.time}")),
        ListTile(title: Text("Difficulty: ${elixir.difficulty}")),
        ListTile(
          title: Text(
            "Ingredients: ${elixir.ingredients.map((ingredient) => ingredient.name).join(", ")}",
          ),
        ),
        ListTile(
          title: Text(
            "Inventors: ${elixir.inventors.map((inventor) => "${inventor.firstName} ${inventor.lastName}").join(", ")}",
          ),
        ),
        ListTile(title: Text("Manufacturer: ${elixir.manufacturer}")),
      ],
    );
  }
}