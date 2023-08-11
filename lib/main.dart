import 'package:flutter/material.dart';
import 'question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


void main() => runApp(EzyQuizzy());


class EzyQuizzy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}


class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}


class _QuizPageState extends State<QuizPage> {
  QuestionBrain quizBrain = QuestionBrain();
  List<Icon> icons = [];

  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade800,
            ),
          ],
        ),
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestion(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true, context);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(false, context);
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
          child: Row(
            children: icons,
          ),
        )
      ],
    );
  }

  void checkAnswer(bool userSelection, context) {
    setState(() {
      if (quizBrain.isQuizFinished()) {
        Alert(
            context: context, title: "Finished!",
            desc: "You've reached the end of the quiz."
        ).show();
        icons.clear();
        quizBrain.reset();
        progress = 0.0;
      } else {
        bool correctAnswer = quizBrain.getAnswer();

        if (userSelection == correctAnswer) {
          icons.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          icons.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrain.nextQuestion();
        progress  = quizBrain.getProgress();
      }
    });
  }
}
