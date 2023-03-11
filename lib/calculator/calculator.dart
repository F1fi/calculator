import 'package:calculator/calculator/calculator_buttons.dart';
import 'package:calculator/calculator/result.dart';
import 'package:calculator/models/operation_type.dart';
import 'package:flutter/material.dart';


class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String value = _defaultValue;
  double? oldNumValue;
  bool waitingForInput = false;
  Operation? lastOperation;
  Operation? activeOperation;

  static const _defaultValue = '0';

  bool get isZero => value == "0";
  bool get isNegative => value[0] == "-";
  bool get hasComma => value.contains(",");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Result(
              value: value,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: CalculatorButtons(
            clear: _clear,
            mirrorValue: _mirrorValue,
            setProcent: _setProcent,
            inputNum: _inputNum,
            inputComma: _inputComma,
            setOperation: _setOperation,
            activeOperation: waitingForInput ? activeOperation : null,
          ),
        )
      ],
    );
  }

  void _clear(){
    waitingForInput = false;
    oldNumValue = null;
    setState(() => value = _defaultValue);
  }

  void _mirrorValue(){
    waitingForInput = false;
    if(isNegative){
       setState(() => value = value.substring(1));
    }
    else{
      setState(() => value = "-$value");
    } 
  }

  void _setProcent(){
    waitingForInput = false;
    final procent = parseValue()/100;
    setState(() => value = "$procent");
  }

  void _inputNum(int number){
    if(waitingForInput){
      _onNewInput();

      setState(() => value = "$number");

      return;
    }
    

    if(isZero){
      setState(() => value = "$number");
    }else{
      setState(() => value = "$value$number");
    }
  }

  void _inputComma(){
    if(waitingForInput){
      _onNewInput();

      setState(() => value = "0,");

      return;
    }

    if(hasComma) return;

    setState(() => value = "$value,");
  }

  void _onNewInput(){
    setState(() {
      waitingForInput = false;
      oldNumValue = parseValue();
      activeOperation = null;
    });
  }

  void _setOperation(Operation type){
    if(waitingForInput){
      if(type == Operation.equal){
        setState(() => activeOperation = null);
      }else{
        setState(() => activeOperation = type);
      }

      return;
    }

    setState((){
      waitingForInput = true;
      activeOperation = type;
    });

    _setResultFromLastOperation();
    if(type == Operation.equal) {
      lastOperation = null;
      setState(() => activeOperation = null);
 
      return;
    }
    lastOperation = type;
  }

  void _setResultFromLastOperation(){
    final isUpdateNeeded = oldNumValue != null && lastOperation != null;

    if(!isUpdateNeeded) return;
    
    switch (lastOperation) {
      case Operation.plus:
        final result = oldNumValue! + parseValue();
        setState(() => value = "$result");
        break;
      case Operation.minus:
        final result = oldNumValue! - parseValue();
        setState(() => value = "$result");
        break;
      case Operation.multiplication:
        final result = oldNumValue! * parseValue();
        setState(() => value = "$result");
        break;
      case Operation.division:
        final result = oldNumValue! / parseValue();
        setState(() => value = "$result");
        break;
      default:
        break;
    }

    final doubleValue = parseValue();
    final intValue = doubleValue.toInt();

    final isInt = doubleValue == intValue;
    if(isInt){
      setState(() => value = "$intValue");
    }else{
      final updatedValue = value.replaceAll('.', ',');
      setState(() => value = updatedValue);
    }
  }

  double parseValue(){
    final correctValue = value.replaceAll(',', '.');

    return double.parse(correctValue);
  }
}