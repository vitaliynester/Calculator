import 'package:math_expressions/math_expressions.dart';

class Calculator {
  String funcAC() {
    return "0.0";
  }

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
      return exp.substring(0, exp.length - 1);
    } else {
      return "0";
    }
  }
}
