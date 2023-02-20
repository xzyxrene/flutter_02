import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': ['Red', 'Blue', 'Green', 'Yellow'],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': ['Lion', 'Tiger', 'Elephant', 'Giraffe'],
    },
    {
      'questionText': 'Which age group do you belong in?',
      'answers': ['Below 21', '21 to 45', '46 to 60', 'Above 60'],
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'] as String,
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('Yay... You did it!'),
              ),
      ),
    );
  }
}
