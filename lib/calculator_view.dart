import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'calculator_button.dart';
import 'calculator_logic.dart';
import 'gesture_button.dart';

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String _resultCalc = "0.0";
  String _helpedText = "";
  Calculator calculator = new Calculator();

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
          _helpedText = calculator.calc(_helpedText + _resultCalc) + op;
          _resultCalc = "0.0";
        }
      }
    });
  }

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
                  GestureButton(
                    buttonText: "÷",
                    buttonFunction: addOperation,
                    buttonTextColor: Colors.orange,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureButton(
                    buttonText: "7",
                    buttonFunction: addNumberToResult,
                  ),
                  GestureButton(
                    buttonText: "8",
                    buttonFunction: addNumberToResult,
                  ),
                  GestureButton(
                    buttonText: "9",
                    buttonFunction: addNumberToResult,
                  ),
                  GestureButton(
                    buttonText: "x",
                    buttonFunction: addOperation,
                    buttonTextColor: Colors.orange,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureButton(
                    buttonText: "4",
                    buttonFunction: addNumberToResult,
                  ),
                  GestureButton(
                    buttonText: "5",
                    buttonFunction: addNumberToResult,
                  ),
                  GestureButton(
                    buttonText: "6",
                    buttonFunction: addNumberToResult,
                  ),
                  GestureButton(
                    buttonText: "-",
                    buttonTextColor: Colors.orange,
                    buttonTextSize: 45,
                    buttonFunction: addOperation,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureButton(
                    buttonText: "1",
                    buttonFunction: addNumberToResult,
                  ),
                  GestureButton(
                    buttonText: "2",
                    buttonFunction: addNumberToResult,
                  ),
                  GestureButton(
                    buttonText: "3",
                    buttonFunction: addNumberToResult,
                  ),
                  GestureButton(
                    buttonText: "+",
                    buttonFunction: addOperation,
                    buttonTextColor: Colors.orange,
                    buttonTextSize: 45,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureButton(
                    buttonText: "0",
                    buttonFunction: addNumberToResult,
                    buttonIsPill: true,
                  ),
                  GestureButton(
                    buttonText: ".",
                    buttonFunction: addOperation,
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
