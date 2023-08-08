import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, required this.onPress, super.key});

  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 20),
      ),
      child: Text(text),
    );
  }
}
