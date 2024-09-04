import 'package:flutter/material.dart';
import 'package:solution/app/core/constants/constant.dart';

import '../../../data/models/quiz_model.dart';

class QuizScreen extends StatelessWidget {
  final List<QuizQuestion> questions = [
    QuizQuestion(
      question: "Who is the founder of Gryffindor?",
      options: [
        "Godric Gryffindor",
        "Salazar Slytherin",
        "Rowena Ravenclaw",
        "Helga Hufflepuff"
      ],
      correctAnswer: "Godric Gryffindor",
    ),
    QuizQuestion(
      question: "What is the name of Harry Potter's owl?",
      options: ["Hedwig", "Errol", "Pigwidgeon", "Fawkes"],
      correctAnswer: "Hedwig",
    ),
    QuizQuestion(
      question: "Which spell is used to disarm an opponent?",
      options: ["Expelliarmus", "Stupefy", "Lumos", "Alohomora"],
      correctAnswer: "Expelliarmus",
    ),
    QuizQuestion(
      question: "What position does Harry play on his Quidditch team?",
      options: ["Seeker", "Chaser", "Beater", "Keeper"],
      correctAnswer: "Seeker",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.quiz),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return QuizQuestionWidget(question: question);
        },
      ),
    );
  }
}

class QuizQuestionWidget extends StatefulWidget {
  final QuizQuestion question;

  QuizQuestionWidget({super.key, required this.question});

  @override
  _QuizQuestionWidgetState createState() => _QuizQuestionWidgetState();
}

class _QuizQuestionWidgetState extends State<QuizQuestionWidget> {
  String? selectedOption;
  String feedbackMessage = '';

  void submitAnswer(String? value) {
    setState(() {
      selectedOption = value;
      if (value == widget.question.correctAnswer) {
        feedbackMessage = 'Correct! 🎉';
      } else {
        feedbackMessage =
            'Wrong! 😞 The correct answer is ${widget.question.correctAnswer}.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.question.question,
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            ...widget.question.options.map((option) => RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: selectedOption,
                  onChanged: submitAnswer,
                )),
            if (feedbackMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  feedbackMessage,
                  style: TextStyle(
                    color: feedbackMessage.startsWith('Correct')
                        ? Colors.green
                        : Colors.red,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
