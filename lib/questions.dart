class Question {
  late bool questionAnswer;
  late String questionText;

  Question({required String q, required bool a}) {
    questionText = q;
    questionAnswer = a;
  }
}
