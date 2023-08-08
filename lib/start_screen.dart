import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  void onPressButton() {
    print('ciao');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              height: 400,
              fit: BoxFit.contain,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text('Let\'s play some quiz!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: 20),
          OutlinedButton.icon(
              onPressed: () {
                // ...code
              },
              label: const Text('Start'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shadowColor: Colors.white,
              ),
              icon: const Icon(Icons.play_arrow, color: Colors.white))
        ],
      ),
    );
  }
}
