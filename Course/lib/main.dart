import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  //the run app method takes the app widget and runs it. Provided by Material.dart
  runApp(MyApp());
}

//the class is called GameTrackerApp and it inherits the statelessWidget class, which is assigned in the material.dart.

//The difference between a statefull- and stateless widget is, the ability to have an internal state, which can update the data inside the class. The inputdata and UI rendering can change, but the internal data cant change in a stateless widget. In the statefull widget, the UI gets rerendered, whenever the external intputdata changes, or the state changes.
//When its a statefull widget, its to classes instead of one

class MyApp extends StatefulWidget {
  @override

  //it is important to create a function, that creates the state, and returns it as a statefulWidget.
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//the '_' makes the class private.
//state is a generic type, and by utilising <> we can point to MyApp.
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Blue', 'score': 3},
        {'text': 'White', 'score': 4},
        {'text': 'Green', 'score': 5},
        {'text': 'Yellow', 'score': 6}
      ]
    },
    {
      'question': 'what\'s your age?',
      'answers': [
        {'text': '16', 'score': 1},
        {'text': '17', 'score': 2},
        {'text': '18', 'score': 3},
        {'text': '19', 'score': 4},
        {'text': '20', 'score': 5}
      ]
    },
    {
      'question': 'what is your favourite programming language?',
      'answers': [
        {'text': 'C#', 'score': 1},
        {'text': 'Dart', 'score': 2},
        {'text': 'Java', 'score': 3},
        {'text': 'Java', 'score': 4},
        {'text': 'C++', 'score': 5}
      ]
    }
  ];
  var _totalScore = 0;
  var _questionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    //we have to tell flutter, that we are about to change the state, and that is done by creating the setState function, which takes an anonymous function as an argument.
    print('Total score: $_totalScore');
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) print('answer chosen');
    print(_questionIndex.toString());
  }

  //override is not required, its a decorater. it makes the code cleaner. it tells the compiler that we are overriding the existing statelessWigdet with our own implementation.
  @override
  //this method takes a BuildContext as an argument, and it defines a set of rul
  //because the entire app is a widget, the buildfunction is called by flutter, to build the entire app, as a "widget tree".
  // flutter runs build everytime it needs to reset the interface on the screen
  Widget build(BuildContext context) {
    //this special wigdet (provided by material.dart) that does some base setup, of the app. it takes named arguments, which is called upon, by their name, fx: home

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          //this column contains children widgets.
          body: _questionIndex < _questions.length
              ? Quiz(_answerQuestion, _questions, _questionIndex)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
