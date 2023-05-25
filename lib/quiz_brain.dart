import 'package:quizzler_app/questions.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
        questionAnswer: true,
        questionText: 'Some cats are actually allergic to humans.'),
    Question(
        questionAnswer: false,
        questionText: 'You can lead a cow down stairs but not up stairs.'),
    Question(
        questionAnswer: true,
        questionText:
            'Approximately one quarter of human bones are in the feet.'),
    Question(questionAnswer: true, questionText: 'A slug\'s blood is green.'),
    Question(
        questionAnswer: true,
        questionText: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".'),
    Question(
        questionAnswer: true,
        questionText: 'It is illegal to pee in theOcean in Portugal.'),
    Question(
        questionAnswer: false,
        questionText:
            'No piece of square dry paper can be folded in half more than 7 times.'),
    Question(
        questionAnswer: true,
        questionText:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.'),
    Question(
        questionAnswer: false,
        questionText:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
