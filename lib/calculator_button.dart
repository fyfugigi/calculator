import 'package:flutter/material.dart';

typedef ButtonTapCallback = void Function(String text);

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color fontColor;
  final Color backgroundColor;
  final double width;
  final ButtonTapCallback onTap;

  const CalculatorButton(this.text, this.fontColor, this.backgroundColor, this.width, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => onTap(text),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        height: h * 0.09,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          color: backgroundColor,
        ),
        child: Text(text, style: TextStyle(color: fontColor, fontSize: 30)),
      ),
    );
  }
}
