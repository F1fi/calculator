import 'package:calculator/calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class CommaButton extends StatelessWidget {
  final void Function() onTap;


  const CommaButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
      color: Colors.grey,
      onTap: onTap,
      text: ",",
      fontSize: 35,
    );
  }
}