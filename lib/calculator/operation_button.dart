import 'package:calculator/calculator/calculator_button.dart';
import 'package:calculator/common/calculator_colors.dart';
import 'package:calculator/models/operation_type.dart';
import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  final Operation type;
  final void Function(Operation) onTap;
  final Operation? activeOperation;

  bool get isActive => type == activeOperation;

  const OperationButton({
    Key? key,
    required this.type,
    required this.onTap,
    this.activeOperation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalculatorButton(
      color: isActive ? CalculatorColors.activeOperationButton : CalculatorColors.operationButton,
      onTap: () => onTap(type),
      text: type.getSymbol(),
    );
  }
}