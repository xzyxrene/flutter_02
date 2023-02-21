import 'package:flutter/material.dart';
import 'package:flutter_02/quiz.dart';
import 'package:flutter_02/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 7},
        {'text': 'Green', 'score': 4},
        {'text': 'Yellow', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Lion', 'score': 5},
        {'text': 'Tiger', 'score': 4},
        {'text': 'Giraffe', 'score': 2},
        {'text': 'Elephant', 'score': 3},
      ],
    },
    {
      'questionText': 'Which age group do you belong in?',
      'answers': [
        {'text': 'Below 21', 'score': 2},
        {'text': '21 to 45', 'score': 1},
        {'text': '46 to 60', 'score': 1},
        {'text': 'Above 60', 'score': 2},
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
    });
    _totalScore += score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
