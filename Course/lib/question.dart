import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  //final means the proporty of the object does cant change after its created.
  final String questionText;

  //constructor
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //edgeIntsets.all() is an additional constructor
      margin: EdgeInsets.all(10),
      //Text does only take as much UI-space as the string needs.
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        //TextAlign is Enum (a list of predefined values, assigned in material.dart)
        textAlign: TextAlign.center,
      ),
    );
  }
}
