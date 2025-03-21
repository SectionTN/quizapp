import 'package:flutter/material.dart';
import 'package:quiz/models/quiz_question.dart';
import 'package:quiz/screens/summary.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.chosenAnswers,
    required this.shuffledQuestions,
  });

  final List<String> chosenAnswers;
  final List<QuizQuestion> shuffledQuestions;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': shuffledQuestions[i].question,
        'correct_answer': shuffledQuestions[i].correctAnswer,
        'user_answer': chosenAnswers[i],
        "is_correct": shuffledQuestions[i].isAnswerCorrect(chosenAnswers[i]),
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = summaryData.length;
    final numCorrectQuestions =
        summaryData.where((data) => data['is_correct'] == true).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!'),
            SizedBox(height: 30),
            Summary(summaryData: summaryData),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
