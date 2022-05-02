import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'calculator_button.dart';
import 'calculator_provider.dart';
import 'gesture_button.dart';

class CalculatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      builder: (context, provider, child) {
        return Material(
          color: Color(0xffffff),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Spacer(),
                AutoSizeText(
                  provider.resultCalculation,
                  style: GoogleFonts.montserrat(
                    fontSize: 100,
                    fontWeight: FontWeight.w200,
                  ),
                  minFontSize: 30,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  provider.helpedText,
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
                        onTap: () => provider.funcAC(),
                        child: CalculatorButton(text: "AC"),
                      ),
                      GestureDetector(
                        onTap: () => provider.funcPlusMinus(),
                        child: CalculatorButton(text: "+/-"),
                      ),
                      GestureDetector(
                        onTap: () => provider.funcRemoveLast(),
                        child: CalculatorButton(text: "DEL"),
                      ),
                      GestureButton(
                        buttonText: "÷",
                        buttonFunction: provider.addOperation,
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
                        buttonFunction: provider.addNumber,
                      ),
                      GestureButton(
                        buttonText: "8",
                        buttonFunction: provider.addNumber,
                      ),
                      GestureButton(
                        buttonText: "9",
                        buttonFunction: provider.addNumber,
                      ),
                      GestureButton(
                        buttonText: "x",
                        buttonFunction: provider.addOperation,
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
                        buttonFunction: provider.addNumber,
                      ),
                      GestureButton(
                        buttonText: "5",
                        buttonFunction: provider.addNumber,
                      ),
                      GestureButton(
                        buttonText: "6",
                        buttonFunction: provider.addNumber,
                      ),
                      GestureButton(
                        buttonText: "-",
                        buttonTextColor: Colors.orange,
                        buttonTextSize: 45,
                        buttonFunction: provider.addOperation,
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
                        buttonFunction: provider.addNumber,
                      ),
                      GestureButton(
                        buttonText: "2",
                        buttonFunction: provider.addNumber,
                      ),
                      GestureButton(
                        buttonText: "3",
                        buttonFunction: provider.addNumber,
                      ),
                      GestureButton(
                        buttonText: "+",
                        buttonFunction: provider.addOperation,
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
                        buttonFunction: provider.addNumber,
                        buttonIsPill: true,
                      ),
                      GestureButton(
                        buttonText: ".",
                        buttonFunction: provider.addOperation,
                      ),
                      GestureDetector(
                        onTap: () => provider.funcEquals(),
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
      },
    );
  }
}
