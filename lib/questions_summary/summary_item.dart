import 'package:adv_basics/questions_summary/question_content.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.data, {super.key});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(data),
        SizedBox(width: 10),
        QuestionContent(data),
      ],
    );
  }
}
