import 'package:flutter/material.dart';

class TriviaCard extends StatelessWidget {
  final String trivia;

  const TriviaCard({super.key, required this.trivia});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          trivia,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
