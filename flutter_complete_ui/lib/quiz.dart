import 'package:flutter/material.dart';
import 'package:flutter_complete_ui/answer.dart';

import 'questtion.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int quesIndex;
  final Function onPress;
  Quiz({this.quesIndex, this.questions, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Question(questions[quesIndex]['questionText']),
          ...(questions[quesIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(
              label: answer['label'],
              onPressHandler: () => onPress(answer['score']),
            );
          }).toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Answer(
                label: 'Ans 2',
                onPressHandler: () => print('2'),
              ),
              Text(
                'Center',
                textAlign: TextAlign.right,
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.greenAccent,
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "Flat Button",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
