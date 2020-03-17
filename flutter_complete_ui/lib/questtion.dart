import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String label;
  Question(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      child: Text(
        label,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }
}
