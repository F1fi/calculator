import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String value;

  static const _textStyle = TextStyle(fontSize: 24, color: Colors.white);

  const Result({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(value, style: _textStyle);
  }
}