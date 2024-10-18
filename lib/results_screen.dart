import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.answers, required this.onRepeat});

  final List<String> answers;
  final void Function() onRepeat;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < answers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'selected_answer': answers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final int allAnswers = answers.length;
    final int correctAnswers = summaryData
        .where((data) => data['correct_answer'] == data['selected_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $allAnswers questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 252),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: onRepeat,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 243, 222, 222),
                side: BorderSide.none,
              ),
              icon: const Icon(Icons.restart_alt_outlined),
              label: const Text('Repeat Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
