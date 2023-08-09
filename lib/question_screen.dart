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
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                text: answer,
                onPress: () {
                  onPressQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
