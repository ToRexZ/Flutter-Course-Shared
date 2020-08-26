import 'package:flutter/material.dart';

class SomeText extends StatelessWidget {
  final String text;

  SomeText(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}
