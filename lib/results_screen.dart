import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.onRestart, required this.answers, super.key});

  final void Function() onRestart;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'You anwsered x of y questions correctly',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            const Text('List of answers and questions'),
            TextButton(
              onPressed: onRestart,
              child: const Text('Restart'),
            )
          ],
        ),
      ),
    );
  }
}
