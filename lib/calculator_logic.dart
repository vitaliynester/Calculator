import 'package:math_expressions/math_expressions.dart';

class Calculator {
  String calc(String exp) {
    try {
      Parser p = Parser();
      exp = exp.replaceAll("x", "*");
      exp = exp.replaceAll("÷", "/");
      Expression res = p.parse(exp);
      return res
          .simplify()
          .evaluate(EvaluationType.REAL, ContextModel())
          .toString();
    } catch (e) {
      return "0.0";
    }
  }

  String plusMinus(String exp) {
    var buf = double.parse(calc(exp));
    return (-buf).toString();
  }

  String ac() {
    return "0.0";
  }

  String removeLast(String exp) {
    if (exp.length > 1) {
      var value = exp.substring(0, exp.length - 1);
      var char = value[value.length - 1];
      if (value.length > 1 &&
          (char != '0' &&
              char != '1' &&
              char != '2' &&
              char != '3' &&
              char != '4' &&
              char != '5' &&
              char != '6' &&
              char != '7' &&
              char != '8' &&
              char != '9')) {
        return removeLast(value);
      }
      return value;
    } else {
      return "0";
    }
  }
}
