import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(this.answerQuestion, this.questions, this.questionIndex);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['question']),
        //the 3 dots takes a list and converts the values from a list to a list, instead of a list to a list (nested list).
        //by having an anonymous function, where we pass in 2 arguments, and maps the specified List<String> to strings of answer texts. This is then passed in to the answer widget, and then made into a list of answerwidgets with the specified answerQuestion function, and answers. All of this is converted back to a list, and then converted into widgets, by the three dots.
        //The three dots is called a spread operator.
        ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
          return Answer(()=> answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
