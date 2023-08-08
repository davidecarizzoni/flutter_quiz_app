import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // use widget to be more restrictive with types. In this case var is not allowed
  Widget? activeScreen;

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
      activeScreen = const QuestionScreen();
    });
    //on setState change the build method is called again
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
