import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

//_ using to indicate a private things (like class but also variables)
// _QuizState can be used only in this file, by the QuizWidget and not outside
class _QuizState extends State<Quiz> {
  // use widget to be more restrictive with types. In this case var is not allowed
  Widget? activeScreen;
  Widget? questionScreen;
  final List<String> selectedAnswers =
      []; // final. Not allowed to ri assign variable, only add

  // every widget has a lifecycle
  // initState => Executed by Flutter when the StatefulWidget's State object is initialized
  // build => Executed when the widget is build for the first time and after a setState changes
  // dispose => Executed just before the widget will be deleted

  @override
  void initState() {
    // executed only once
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      // change the active screen
      activeScreen = QuestionScreen(
        onSelectAnswer: onSelectAnswer,
        onFinish: goToResultScreen,
      );
    });
    //on setState change the build method is called again
  }

  void goToResultScreen() {
    setState(() {
      activeScreen = ResultScreen(
        onRestart: () {
          setState(() {
            activeScreen = StartScreen(switchScreen);
          });
        },
        chosenAnswers: selectedAnswers,
      );
    });
  }

  void onSelectAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
    });

    print(selectedAnswers);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.purple],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
