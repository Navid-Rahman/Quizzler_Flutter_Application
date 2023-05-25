import 'package:flutter/material.dart';
import 'package:quizzler_app/questions.dart';
import 'package:quizzler_app/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
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

List<bool> answer = [
  false,
  true,
  true,
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
                quizBrain.questionBank[questionNumber].questionText,
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
                bool correctAnswer =
                    quizBrain.questionBank[questionNumber].questionAnswer;

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
                    quizBrain.questionBank[questionNumber].questionAnswer;

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
