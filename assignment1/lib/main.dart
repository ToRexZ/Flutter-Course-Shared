import 'package:flutter/material.dart';

import 'TextControl.dart';
import 'text.dart';

void main() {
  runApp(Assignment1());
}

class Assignment1 extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _Assignment1State();
  }
}

class _Assignment1State extends State<Assignment1> {
  String text = 'some text';
  void changeText() {
    setState(() {
      text = 'Some other text';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignment1'),
        ),
        body: Column(
          children: <Widget>[
            SomeText(text),
            TextControl(changeText),
          ],
        ),
      ),
    );
  }
}
