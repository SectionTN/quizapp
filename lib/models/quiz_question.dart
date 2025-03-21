class QuizQuestion {
  const QuizQuestion({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  final String question;
  final List<String> answers;
  final List<String> correctAnswer;

  bool isAnswerCorrect(String answer) {
    return correctAnswer.contains(answer);
  }

  List<String> get shuffledAnswers {
    final shuffled = List<String>.from(answers);
    shuffled.shuffle();
    return shuffled;
  }

  static List<QuizQuestion> getShuffledQuestions(List<QuizQuestion> questions) {
    final shuffledQuestions = List<QuizQuestion>.from(questions);
    shuffledQuestions.shuffle();
    return shuffledQuestions;
  }
}
