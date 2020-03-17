import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String label;
  final Function onPressHandler;

  Answer({this.label, this.onPressHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: onPressHandler,
        child: Text(label),
        color: Colors.blue[200],
        textColor: Colors.white,
        splashColor: Colors.blue[100],
      ),
    );
  }
}
