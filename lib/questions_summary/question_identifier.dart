import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(this.data, {super.key});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAnswer =
        data['selected_answer'] == data['correct_answer'];
    final Color questionIndexColor = isCorrectAnswer
        ? Color.fromARGB(255, 115, 218, 250)
        : Color.fromARGB(255, 232, 86, 132);

    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: questionIndexColor,
      ),
      alignment: Alignment.center,
      child: Text(
        ((data['question_index'] as int) + 1).toString(),
      ),
    );
  }
}
