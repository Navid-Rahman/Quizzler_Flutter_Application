import 'package:flutter/material.dart';
import 'package:quizzler_app/questions.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() {
    return _QuizPageState();
  }
}

// List<String> questions = [
//   'You can lead a cow down stairs but not up stairs.',
//   'Approximately one quarter of human bones are in the feet.',
//   'A slug\'s blood is green.',
// ];

List<bool> answer = [
  false,
  true,
  true,
];

// Question q1 =
//     Question(q: 'You can lead a cow down stairs but not up stairs.', a: false);

List<Question> questionBank = [
  Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
  Question(
      q: 'Approximately one quarter of human bones are in the feet.', a: true),
  Question(q: 'A slug\'s blood is green.', a: true),
];

int questionNumber = 0;

List<Icon> scoreKeeper = [
  // const Icon(
  //   Icons.check,
  //   color: Colors.green,
  // ),
  // const Icon(
  //   Icons.close,
  //   color: Colors.red,
  // ),
];

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                // setState(() {
                //   scoreKeeper.add(const Icon(
                //     Icons.check,
                //     color: Colors.green,
                //   ));
                // });

                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;

                if (correctAnswer == true) {
                  print('User got it right!');
                } else {
                  print('User got it wrong!');
                }

                setState(() {
                  questionNumber = questionNumber + 1;
                });
                print(questionNumber);
              },
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                // setState(() {
                //   scoreKeeper.add(const Icon(
                //     Icons.close,
                //     color: Colors.red,
                //   ));
                // });

                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;

                if (correctAnswer == false) {
                  print('User got it right!');
                } else {
                  print('User got it wrong!');
                }

                setState(() {
                  questionNumber = questionNumber + 1;
                });
              },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        //TODO: Add a Row here for score keeping
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
