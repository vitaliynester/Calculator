import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final bool isPill;

  const CalculatorButton(
      {Key key, this.text, this.textColor, this.textSize, this.isPill = false})
      : super(key: key);

  @override
  _CalculatorButtonState createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final squareSideLength = size.width / 5;
    final buttonWidth = squareSideLength * (widget.isPill ? 2.2 : 1);
    final buttonSize = Size(buttonWidth, squareSideLength);
    return SizedBox(
      height: buttonSize.height,
      width: buttonSize.width,
      child: Listener(
        onPointerDown: _onPointerDown,
        onPointerUp: _onPointerUp,
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 50),
              padding: EdgeInsets.all(size.width / 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(buttonSize.width),
                color: Colors.white70,
                boxShadow: _isPressed ? showInnerShadow() : showShadow(),
              ),
            ),
            Align(
              alignment: Alignment(widget.isPill ? -.65 : 0, 0),
              child: Text(
                widget.text,
                style: GoogleFonts.montserrat(
                  fontSize: widget.textSize ?? 30,
                  fontWeight: FontWeight.w200,
                  color: widget.textColor ?? Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BoxShadow> showShadow() {
    return [
      BoxShadow(
        blurRadius: 15,
        color: Color(0xffedebeb),
      ),
      BoxShadow(
        blurRadius: 15,
        color: Color(0xffeae9e9),
      )
    ];
  }

  List<BoxShadow> showInnerShadow() {
    return [
      BoxShadow(
        blurRadius: 15,
        color: Colors.grey[300],
      ),
      BoxShadow(
        blurRadius: 15,
        color: Colors.grey[350],
      )
    ];
  }
}
