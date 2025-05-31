import 'package:flutter/material.dart';
import 'package:flutter_application_1/calculator_home.dart';
// ignore: unused_import
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(CalculatorApp());

enum CalculatorMode { basic, scientific }

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  CalculatorMode mode = CalculatorMode.basic;
  List<String> history = [];

  void updateMode(CalculatorMode newMode) {
    setState(() {
      mode = newMode;
    });
  }

  void addToHistory(String entry) {
    setState(() {
      history.add(entry);
    });
  }

  void clearHistory() {
    setState(() {
      history.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorHome(
        mode: mode,
        updateMode: updateMode,
        history: history,
        addToHistory: addToHistory,
        clearHistory: clearHistory,
      ),
    );
  }
}
