import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'calculator_button.dart';
import 'calculator_logic.dart';

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String _resultCalc = "0.0";
  String _helpedText = "";
  void addNumberToResult(String number) {
    setState(() {
      if (_resultCalc == "0.0" || _resultCalc == "0") {
        _resultCalc = number;
      } else {
        _resultCalc += number;
      }
    });
  }

  void addOperation(String op) {
    setState(() {
      if (op == ".") {
        if (_resultCalc.contains(".")) {
          return;
        } else {
          _resultCalc += op;
        }
      } else {
        if (_resultCalc[_resultCalc.length - 1] != "÷" &&
            _resultCalc[_resultCalc.length - 1] != "x" &&
            _resultCalc[_resultCalc.length - 1] != "-" &&
            _resultCalc[_resultCalc.length - 1] != "+") {
          _helpedText = _resultCalc + op;
          _resultCalc = "0.0";
        }
      }
    });
  }

  Calculator calculator = new Calculator();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffffff),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Spacer(),
            AutoSizeText(
              _resultCalc,
              style: GoogleFonts.montserrat(
                fontSize: 100,
                fontWeight: FontWeight.w200,
              ),
              minFontSize: 30,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            AutoSizeText(
              _helpedText,
              style: GoogleFonts.montserrat(
                fontSize: 50,
                fontWeight: FontWeight.w100,
              ),
              minFontSize: 30,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _resultCalc = calculator.funcAC();
                      });
                    },
                    child: CalculatorButton(
                      text: "AC",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _resultCalc = calculator.plusMinus(_resultCalc);
                      });
                    },
                    child: CalculatorButton(
                      text: "+/-",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _resultCalc = calculator.removeLast(_resultCalc);
                      });
                    },
                    child: CalculatorButton(
                      text: "DEL",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => addOperation("÷"),
                    child: CalculatorButton(
                      text: "÷",
                      textColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => addNumberToResult("7"),
                    child: CalculatorButton(
                      text: "7",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => addNumberToResult("8"),
                    child: CalculatorButton(
                      text: "8",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => addNumberToResult("9"),
                    child: CalculatorButton(
                      text: "9",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => addOperation("x"),
                    child: CalculatorButton(
                      text: "x",
                      textColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => addNumberToResult("4"),
                    child: CalculatorButton(
                      text: "4",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => addNumberToResult("5"),
                    child: CalculatorButton(
                      text: "5",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => addNumberToResult("6"),
                    child: CalculatorButton(
                      text: "6",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => addOperation("-"),
                    child: CalculatorButton(
                      text: "-",
                      textColor: Colors.orange,
                      textSize: 45,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => addNumberToResult("1"),
                    child: CalculatorButton(
                      text: "1",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => addNumberToResult("2"),
                    child: CalculatorButton(
                      text: "2",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => addNumberToResult("3"),
                    child: CalculatorButton(
                      text: "3",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => addOperation("+"),
                    child: CalculatorButton(
                      text: "+",
                      textColor: Colors.orange,
                      textSize: 45,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => addNumberToResult("0"),
                    child: CalculatorButton(
                      text: "0",
                      isPill: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => addOperation("."),
                    child: CalculatorButton(
                      text: ".",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _resultCalc =
                            calculator.calc(_helpedText + _resultCalc);
                        _helpedText = "";
                      });
                    },
                    child: CalculatorButton(
                      text: "=",
                      textColor: Colors.orange,
                      textSize: 45,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
