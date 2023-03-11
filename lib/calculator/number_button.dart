import 'package:calculator/calculator/calculator_button.dart';
import 'package:calculator/common/calculator_colors.dart';
import 'package:flutter/material.dart';


class NumberButton extends StatelessWidget {
  final int value;
  final void Function(int) onTap;

  const NumberButton({
    Key? key,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
      color: CalculatorColors.numberButton,
      onTap: () => onTap(value),
      text: "$value",
    );
  }
}