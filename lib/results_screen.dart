import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.answers, required this.onRepeat});

  final List<String> answers;
  final void Function() onRepeat;

  @override
  Widget build(BuildContext context) {
    int correctAnswers = 0;
    for (int i = 0; i < answers.length; i++) {
      if (answers[i] == questions[i].answers[0]) {
        correctAnswers++;
      }
    }

    return Center(
        child: Column(
      children: [
        Text(
          'Result: $correctAnswers / ${answers.length}',
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 201, 153, 252),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: onRepeat,
          child: Text('Repeat'),
        )
      ],
    ));
  }
}
