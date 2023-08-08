import 'package:flutter/material.dart';
import 'package:quiz_app/anwer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionState();
  }
}

// state connected to question screen
class _QuestionState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The question title',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 20),
          AnswerButton(
            text: 'Answer 1',
            onPress: () {},
          ),
          AnswerButton(
            text: 'Answer 2',
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
