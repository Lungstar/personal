import 'package:flutter/material.dart';
import 'package:solution/app/core/constants/constant.dart';

class TriviaScreen extends StatefulWidget {
  @override
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  final List<String> triviaFacts = [
    "The Hogwarts motto, 'Draco dormiens nunquam titillandus,' means 'Never tickle a sleeping dragon.'",
    "Dumbledore is an old English word for 'bumblebee.'",
    "The number 7 is considered the most magical number in the Wizarding World.",
    // Add more trivia facts here
  ];

  int currentFactIndex = 0;

  void _nextFact() {
    setState(() {
      currentFactIndex = (currentFactIndex + 1) % triviaFacts.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.trivia),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(triviaFacts[currentFactIndex], style: const TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _nextFact,
                child: const Text('Next Fact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
