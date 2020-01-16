import 'package:flutter/material.dart';

import './result.dart';

import './quiz.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  var _totaScore =0;
  final _questions = const [
    {
      'questionText': 'what\'s your favourite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answer': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 3},
        {'text': 'Elephant', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favorite number?',
      'answer': [
        {'Max': 'Black', 'score': 1},
        {'Max': 'Red', 'score': 1},
        {'Max': 'Green', 'score': 1},
        {'Max': 'White', 'score': 1}
      ],
    }
  ];
  void _resultQuiz(){
    setState(() {
      _questionIndex = 0;
      _totaScore=0;
    });
  }

  void _answerQuestion(int score) {
    _totaScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions)
              : Result(_totaScore,_resultQuiz),
        ),
      );
    }
  }
}
