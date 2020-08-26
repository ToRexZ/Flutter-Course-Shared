import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final result;
  final Function resetQuiz;

  Result(this.result, this.resetQuiz);

  //this is a get property. this is a normal proporty, but the value is calculated dynamicly.
  String get resultPhrase {
    String resultText = 'You did it';
    if (result <= 8)
      resultText = 'You have a wierd taste...';
    else
      resultText = 'You are nice!';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            '$resultPhrase Your score is $result',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            onPressed: resetQuiz,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
