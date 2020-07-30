import 'package:flutter/material.dart';

import 'calculator_button.dart';

class GestureButton extends StatelessWidget {
  final Function buttonFunction;
  final String buttonText;
  final Color buttonTextColor;
  final double buttonTextSize;
  final bool buttonIsPill;
  const GestureButton({
    Key key,
    this.buttonFunction,
    this.buttonText,
    this.buttonTextColor,
    this.buttonTextSize,
    this.buttonIsPill = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => buttonFunction(buttonText),
      child: CalculatorButton(
        text: buttonText,
        textColor: buttonTextColor,
        textSize: buttonTextSize,
        isPill: buttonIsPill,
      ),
    );
  }
}
