import 'package:calculator/calculator/calculator_button.dart';
import 'package:calculator/common/calculator_colors.dart';
import 'package:calculator/models/additional_operation.dart';
import 'package:flutter/material.dart';

class AdditionalButton extends StatelessWidget {
  final AdditionalOperation type;
  final void Function() onTap;

  const AdditionalButton({
    Key? key,
    required this.type,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
      color: CalculatorColors.additionalButton,
      onTap: onTap,
      text: type.getString(),
    );
  }
}