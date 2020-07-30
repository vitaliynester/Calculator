import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'calculator_button.dart';

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
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
              '2020*3',
              style: GoogleFonts.montserrat(
                fontSize: 100,
                fontWeight: FontWeight.w200,
              ),
              minFontSize: 30,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CalculatorButton(
                    text: "AC",
                  ),
                  CalculatorButton(
                    text: "+/-",
                  ),
                  CalculatorButton(
                    text: "%",
                  ),
                  CalculatorButton(
                    text: "÷",
                    textColor: Colors.orange,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CalculatorButton(
                    text: "7",
                  ),
                  CalculatorButton(
                    text: "8",
                  ),
                  CalculatorButton(
                    text: "9",
                  ),
                  CalculatorButton(
                    text: "x",
                    textColor: Colors.orange,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CalculatorButton(
                    text: "4",
                  ),
                  CalculatorButton(
                    text: "5",
                  ),
                  CalculatorButton(
                    text: "6",
                  ),
                  CalculatorButton(
                    text: "-",
                    textColor: Colors.orange,
                    textSize: 45,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CalculatorButton(
                    text: "1",
                  ),
                  CalculatorButton(
                    text: "2",
                  ),
                  CalculatorButton(
                    text: "3",
                  ),
                  CalculatorButton(
                    text: "+",
                    textColor: Colors.orange,
                    textSize: 45,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CalculatorButton(
                    text: "0",
                    isPill: true,
                  ),
                  CalculatorButton(
                    text: ".",
                  ),
                  CalculatorButton(
                    text: "=",
                    textColor: Colors.orange,
                    textSize: 45,
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
