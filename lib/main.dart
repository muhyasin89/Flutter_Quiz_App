import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
      "questionText": "What\'s your favorite color?",
      "answers": [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 20},
        {'text': 'Red', 'score': 30},
        {'text': 'Black', 'score': 35},
        {'text': 'Green', 'score': 25},
        {'text': 'White', 'score': 40},
      ],
    },
    {
      "questionText": "What\'s your favorite Animal?",
      "answers": [
        {'text': 'cat', 'score': 10},
        {'text': 'dog', 'score': 20},
        {'text': 'Rabbit', 'score': 30},
        {'text': 'Snake', 'score': 35},
        {'text': 'Green', 'score': 25},
        {'text': 'White', 'score': 40},
      ],
    },
  ];

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
        _totalScore += score;
      });
    } else {
      print("No More Question");
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
