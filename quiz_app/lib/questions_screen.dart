import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The Question',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          AnswerButton(
            answerText: "answer 1",
            onTap: () {},
          ),
          AnswerButton(
            answerText: "answer 2",
            onTap: () {},
          ),
          AnswerButton(
            answerText: "answer 3",
            onTap: () {},
          ),
          AnswerButton(
            answerText: "answer 4",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
