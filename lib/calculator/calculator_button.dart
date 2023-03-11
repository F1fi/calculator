import 'package:calculator/common/calculator_colors.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final double? fontSize;
  final void Function() onTap;
  final Color color;

  static const textStyle = TextStyle(
    fontSize: 25,
  );

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = CalculatorColors.white,
    this.fontSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(text, style: textStyle.copyWith(fontSize: fontSize)),
        ),
      ),
    );
  }
}