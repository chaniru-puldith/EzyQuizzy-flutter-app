import 'package:flutter/material.dart';

void main() => runApp(EzyQuizzy());

class EzyQuizzy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
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
  int questionNumber = 0;

  List<Icon> icons = [];

  List<String> questions = [
    'Can you lead a cow down stairs but not up stairs',
    'Can you lead a human down stairs but not up stairs',
    'Can you lead a elephant down stairs but not up stairs'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questions[questionNumber],
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
                questionNumber++;
                setState(() {
                  icons.add(
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                });
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
                setState(() {
                  questionNumber++;
                  icons.add(
                    const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                });
              },
            ),
          ),
        ),
        Row(
          children: icons,
        )
      ],
    );
  }
}
