import 'package:calculator/calculator/additional_button.dart';
import 'package:calculator/calculator/comma_button.dart';
import 'package:calculator/calculator/number_button.dart';
import 'package:calculator/calculator/operation_button.dart';
import 'package:calculator/models/additional_operation.dart';
import 'package:calculator/models/operation_type.dart';
import 'package:flutter/cupertino.dart';

class CalculatorButtons extends StatelessWidget {
  final void Function() clear;
  final void Function() mirrorValue;
  final void Function() setProcent;
  final void Function(int) inputNum;
  final void Function() inputComma;
  final void Function(Operation) setOperation;
  final Operation? activeOperation;

  const CalculatorButtons({Key? key, 
    required this.clear,
    required this.mirrorValue,
    required this.setProcent,
    required this.inputNum,
    required this.inputComma,
    required this.setOperation,
    this.activeOperation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstRow = [
      AdditionalButton(
        type: AdditionalOperation.clear,
        onTap: clear,
      ),
      AdditionalButton(
        type: AdditionalOperation.mirrorValue,
        onTap: mirrorValue,
      ),
      AdditionalButton(
        type: AdditionalOperation.procent,
        onTap: setProcent,
      ),
      OperationButton(
        type: Operation.division,
        onTap: setOperation,
        activeOperation: activeOperation,
      ),
    ];

    final secondRow = [
      NumberButton(
        value: 1,
        onTap: inputNum,
      ),
      NumberButton(
        value: 2,
        onTap: inputNum,
      ),
      NumberButton(
        value: 3,
        onTap: inputNum,
      ),
      OperationButton(
        type: Operation.multiplication,
        onTap: setOperation,
        activeOperation: activeOperation,
      ),
    ];

    final thirdRow = [
      NumberButton(
        value: 4,
        onTap: inputNum,
      ),
      NumberButton(
        value: 5,
        onTap: inputNum,
      ),
      NumberButton(
        value: 6,
        onTap: inputNum,
      ),
      OperationButton(
        type: Operation.minus,
        onTap: setOperation,
        activeOperation: activeOperation,
      ),
    ];

    final fourthRow = [
      NumberButton(
        value: 7,
        onTap: inputNum,
      ),
      NumberButton(
        value: 8,
        onTap: inputNum,
      ),
      NumberButton(
        value: 9,
        onTap: inputNum,
      ),
      OperationButton(
        type: Operation.plus,
        onTap: setOperation,
        activeOperation: activeOperation,
      ),
    ];

    final fivethRow = [
      NumberButton(
        value: 0,
        onTap: inputNum,
      ),
      NumberButton(
        value: 0,
        onTap: inputNum,
      ),
      CommaButton(
        onTap: inputComma,
      ),
      OperationButton(
        type: Operation.equal,
        onTap: setOperation,
        activeOperation: activeOperation,
      ),
    ];

    return GridView.count(
      crossAxisCount: 4,
      children: [
        ...firstRow,
        ...secondRow,
        ...thirdRow,
        ...fourthRow,
        ...fivethRow,
      ],
    );
  }
}