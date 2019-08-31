import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questions = [
    {
      'questionText': 'What\'s Your Favorite Color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s Your Favorite Animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Cat', 'score': 4},
        {'text': 'Dog', 'score': 6},
        {'text': 'Lion', 'score': 9}
      ]
    },
    {
      'questionText': 'What\'s Your Favorite Subject',
      'answers': [
        {'text': 'English', 'score': 3},
        {'text': 'Maths', 'score': 7},
        {'text': 'Chemistry', 'score': 10},
        {'text': 'Computers', 'score': 1}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var check = false;
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // questionIndex = questionIndex + 1;
    print('Answer Chosen of question $_questionIndex');

    if (_questionIndex < _questions.length) {
      print('We Have More Questions');
    } else {
      print('No More Questions');
    }
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
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
