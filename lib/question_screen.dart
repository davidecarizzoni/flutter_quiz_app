import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {required this.onSelectAnswer, required this.onFinish, super.key});

  final void Function(String answer) onSelectAnswer;
  final void Function() onFinish;
  @override
  State<QuestionScreen> createState() {
    return _QuestionState();
  }
}

// state connected to question screen
class _QuestionState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void onPressQuestion(String answer) {
    if (questions.length == currentQuestionIndex + 1) {
      widget.onFinish();
      return;
    }
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  text: answer,
                  onPress: () {
                    onPressQuestion(answer);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
