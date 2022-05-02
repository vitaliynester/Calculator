import 'package:flutter/material.dart';

import 'calculator_logic.dart';

class CalculatorProvider extends ChangeNotifier {
  String _resultCalcultation;
  String _helpedText;
  Calculator _logic;

  String get resultCalculation => _resultCalcultation;
  String get helpedText => _helpedText;

  CalculatorProvider() {
    _logic = Calculator();
    _resultCalcultation = "0";
    _helpedText = "";
  }

  void addNumber(String number) {
    try {
      double.parse(number);
    } catch (e) {
      return;
    }
    _resultCalcultation =
        _resultCalcultation == "0.0" || _resultCalcultation == "0"
            ? number
            : _resultCalcultation + number;
    notifyListeners();
  }

  void addOperation(String operation) {
    try {
      double.parse(operation);
      return;
    } catch (e) {}
    if (operation == ".") {
      if (_resultCalcultation.contains(".")) {
        return;
      } else {
        _resultCalcultation += operation;
      }
    } else {
      if (_resultCalcultation[_resultCalcultation.length - 1] != "÷" &&
          _resultCalcultation[_resultCalcultation.length - 1] != "x" &&
          _resultCalcultation[_resultCalcultation.length - 1] != "-" &&
          _resultCalcultation[_resultCalcultation.length - 1] != "+") {
        _helpedText =
            _logic.calc(_helpedText + _resultCalcultation) + operation;
        _resultCalcultation = "0.0";
      }
    }
    notifyListeners();
  }

  void funcAC() {
    _resultCalcultation = _logic.ac();
    _helpedText = '';
    notifyListeners();
  }

  void funcPlusMinus() {
    _resultCalcultation = _logic.plusMinus(_resultCalcultation);
    notifyListeners();
  }

  void funcRemoveLast() {
    _resultCalcultation = _logic.removeLast(_resultCalcultation);
    notifyListeners();
  }

  void funcEquals() {
    _resultCalcultation = _logic.calc(_helpedText + _resultCalcultation);
    if (_resultCalcultation == 'Infinity') {
      _resultCalcultation = '0.0';
    }
    _helpedText = "";
    notifyListeners();
  }
}
