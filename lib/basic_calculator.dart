import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class BasicCalculator extends StatefulWidget {
  final void Function(String) addToHistory;

  const BasicCalculator({super.key, required this.addToHistory});

  @override
  // ignore: library_private_types_in_public_api
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  String input = '';
  String result = '';

  void evaluate() {
    try {
      // ignore: deprecated_member_use
      Parser p = Parser();
      Expression exp = p.parse(input.replaceAll('×', '*').replaceAll('÷', '/'));
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        result = eval.toString();
        widget.addToHistory('$input = $result');
      });
    } catch (_) {
      setState(() {
        result = 'Error';
      });
    }
  }

  void addInput(String value) {
    setState(() => input += value);
  }

  void clear() {
    setState(() {
      input = '';
      result = '';
    });
  }

  Widget buildButton(String text, {Color color = Colors.black}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => text == '=' ? evaluate() : addInput(text),
        child: Text(text, style: TextStyle(fontSize: 24, color: color)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Center(child: Text(input, style: TextStyle(fontSize: 32)))),
        Text(result, style: TextStyle(fontSize: 24)),
        Row(children: ['7', '8', '9', '÷'].map(buildButton).toList()),
        Row(children: ['4', '5', '6', '×'].map(buildButton).toList()),
        Row(children: ['1', '2', '3', '-'].map(buildButton).toList()),
        Row(children: ['0', '.', '=', '+'].map(buildButton).toList()),
        Row(
          children: [
            Expanded(child: ElevatedButton(onPressed: clear, child: Text('C'))),
          ],
        )
      ],
    );
  }
}
