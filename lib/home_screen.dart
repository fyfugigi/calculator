import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'calculator_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String sum = "0", res = "0", exp1 = "";
  double fontsize1 = 35, fontsize2 = 45;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(sum, style: TextStyle(color: Colors.white, fontSize: fontsize1)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(res, style: TextStyle(color: Colors.white, fontSize: fontsize2)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton("AC", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("%", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("÷", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("C", Colors.white, Color.fromRGBO(250, 168, 34, 1), w * 0.2, onTap),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton("7", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("8", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("9", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("×", Colors.white, Color.fromRGBO(250, 168, 34, 1), w * 0.2, onTap),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton("4", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("5", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("6", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("-", Colors.white, Color.fromRGBO(250, 168, 34, 1), w * 0.2, onTap),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton("1", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("2", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("3", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("+", Colors.white, Color.fromRGBO(250, 168, 34, 1), w * 0.2, onTap),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton("0", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.45, onTap),
              CalculatorButton(".", Colors.black, Color.fromRGBO(250, 244, 244, 0.6), w * 0.2, onTap),
              CalculatorButton("=", Colors.white, Color.fromRGBO(250, 168, 34, 1), w * 0.2, onTap),
            ],
          ),
        ],
      ),
    );
  }

  void onTap(String text) {
    if (text == "=") {
      try {
        exp1 = sum;
        exp1 = exp1.replaceAll("×", "*");
        exp1 = exp1.replaceAll("÷", "/");
        GrammarParser P = GrammarParser();
        Expression exp2 = P.parse(exp1);
        ContextModel con = ContextModel();
        res = "${exp2.evaluate(EvaluationType.REAL, con)}";
        fontsize2 = 45;
        fontsize1 = 35;
        setState(() {});
      } catch (e) {
        fontsize2 = 45;
        fontsize1 = 35;
        res = "ERROR";
        setState(() {});
      }
    } else if (text == "AC") {
      fontsize2 = 45;
      fontsize1 = 35;
      sum = "0";
      res = "0";
      setState(() {});
    } else if (text == "C") {
      fontsize2 = 35;
      fontsize1 = 45;
      if (sum.length == 1) {
        sum = "0";
      } else {
        sum = sum.substring(0, sum.length - 1);
      }
      setState(() {});
    } else {
      fontsize2 = 35;
      fontsize1 = 45;
      if (sum == "0") {
        sum = text;
      } else {
        sum += text;
      }
      setState(() {});
    }
  }
}
