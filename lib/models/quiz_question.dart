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

  List<String> get shuffledAnswers {
    final shuffled = List<String>.from(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
