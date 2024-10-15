import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/questions_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.summaryItem, {super.key});

  final Map<String, Object> summaryItem;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        summaryItem['user_answer'] == summaryItem['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionsIdentifier(
          questionIndex: (summaryItem['question_index'] as int) + 1,
          isCorrectAnswer: isCorrectAnswer,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                summaryItem['question'] as String,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                summaryItem['user_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 149, 199, 250),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                summaryItem['correct_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 98, 249, 141),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
