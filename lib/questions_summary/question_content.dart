import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionContent extends StatelessWidget {
  const QuestionContent(this.data, {super.key});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['question'] as String,
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            data['selected_answer'] as String,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 201, 153, 252),
            ),
          ),
          Text(
            data['correct_answer'] as String,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 115, 218, 250),
            ),
          ),
        ],
      ),
    );
  }
}
