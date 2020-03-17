import 'package:flutter/material.dart';
import 'package:flutter_complete_ui/answer.dart';
import 'package:flutter_complete_ui/quiz.dart';
import 'package:flutter_complete_ui/result.dart';
import './questtion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Question 1',
      'answers': [
        {'label': 'qa 11', 'score': 10},
        {'label': 'qa 12', 'score': 8},
      ]
    },
    {
      'questionText': 'Question 2',
      'answers': [
        {'label': 'qa 21', 'score': 10},
        {'label': 'qa 22', 'score': 8},
      ]
    },
    {
      'questionText': 'Question 3',
      'answers': [
        {'label': 'qa 31', 'score': 10},
        {'label': 'qa 31', 'score': 8},
      ]
    },
  ];

  int _quesIndex = 0;
  int _totalScore = 0;

  void _onPress(int score) {
    _totalScore += score;
    setState(() {
      _quesIndex = _quesIndex < _questions.length ? _quesIndex + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _quesIndex < _questions.length
            ? Quiz(
                quesIndex: _quesIndex,
                questions: _questions,
                onPress: _onPress,
              )
            : Result(_totalScore),
      ),
    );
  }
}
