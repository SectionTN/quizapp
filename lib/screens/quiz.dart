import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/widgets/answer_button.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
      if (questions[currentQuestionIndex].isAnswerCorrect(answer)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Correct!"),
            duration: const Duration(seconds: 1),
          ),
        );
      }

      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Quiz Finished!")));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(title: Text("Questions")),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentQuestion.question, textAlign: TextAlign.center),
              const SizedBox(height: 30),
              ...currentQuestion.shuffledAnswers.map((item) {
                return AnswerButton(
                  answer: item,
                  onSelected: () => answerQuestion(item),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
