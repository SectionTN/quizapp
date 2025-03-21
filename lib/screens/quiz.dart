import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/quiz_question.dart';
import 'package:quiz/screens/result.dart';
import 'package:quiz/widgets/answer_button.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = "question-screen";
  var currentQuestionIndex = 0;
  var shuffledQuestions = QuizQuestion.getShuffledQuestions(questions);
  List<String> chosenAnswers = [];

  void answerQuestion(String answer) {
    setState(() {
      chosenAnswers.add(answer);
      if (currentQuestionIndex < shuffledQuestions.length - 1) {
        currentQuestionIndex++;
      } else {
        activeScreen = "result-screen";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = shuffledQuestions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle(currentQuestionIndex, activeScreen)),
        automaticallyImplyLeading: false,
      ),
      body: whichToRender(
        activeScreen,
        currentQuestion,
        answerQuestion,
        chosenAnswers,
        shuffledQuestions,
      ),
    );
  }
}

String getTitle(int index, String activeScreen) {
  if (activeScreen == "question-screen") {
    return 'Quiz #${index + 1}';
  }
  return 'Quiz Result';
}

Widget whichToRender(
  String activeScreen,
  currentQuestion,
  answerQuestion,
  List<String> chosenAnswers,
  List<QuizQuestion> shuffledQuestions,
) {
  if (activeScreen == "question-screen") {
    return Question(currentQuestion, answerQuestion);
  } else if (activeScreen == "result-screen") {
    return Result(
      chosenAnswers: chosenAnswers,
      shuffledQuestions: shuffledQuestions,
    );
  }
  return const Center(child: Text('No active screen selected.'));
}

Widget Question(currentQuestion, answerQuestion) {
  return SizedBox(
    width: double.infinity,
    child: Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontFamily: "Arial",
            ),
          ),
          const SizedBox(height: 30),
          ...currentQuestion.shuffledAnswers.map((item) {
            return Column(
              children: [
                AnswerButton(
                  answer: item,
                  onSelected: () => answerQuestion(item),
                ),
                const SizedBox(height: 10),
              ],
            );
          }),
        ],
      ),
    ),
  );
}
