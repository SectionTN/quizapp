import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final VoidCallback onSelected;

  const AnswerButton({
    super.key,
    required this.answer,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onSelected, child: Text(answer));
  }
}
