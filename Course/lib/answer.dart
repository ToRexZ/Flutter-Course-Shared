import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //by adding a function proporty and passing a function in via the constructor, i can have a final function, which can be called when the button is pressed.
  final Function answerSelectHandler;
  //difference between final and const:
  //const doesn't chance at all. Final is not allowed changes, though it can be initialized.
  final String answerText;

  Answer(this.answerSelectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(
          answerText,
          //style: TextStyle(color: Colors.white),
        ),
        //because of onPressed needing a value, and the function returns void. The function gets executed emediatly when dart encounters it for the first time. By adding parantheses we assign the returnvalue of the function, and if i leave them out, the value is set to the function.
        //this can also take anonymous functions.
        //onPressed: () => print('Answer 2 chosen'),
        onPressed: answerSelectHandler,
      ),
    );
  }
}
