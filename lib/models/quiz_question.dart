class QuizQuestion {
  const QuizQuestion({
    required this.question,
    required this.answers,
    this.correctAnswer,
  });

  final String question;
  final List<String> answers;
  final String? correctAnswer;

 

  bool isAnswerCorrect(String answer) {
    return answer == correctAnswer;
  }
}