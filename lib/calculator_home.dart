import 'package:flutter/material.dart';
import 'basic_calculator.dart';
import 'scientific_calculator.dart';
import 'settings_page.dart';
import 'history_page.dart';
import 'main.dart';

class CalculatorHome extends StatelessWidget {
  final CalculatorMode mode;
  final void Function(CalculatorMode) updateMode;
  final List<String> history;
  final void Function(String) addToHistory;
  final VoidCallback clearHistory;

  const CalculatorHome({super.key, 
    required this.mode,
    required this.updateMode,
    required this.history,
    required this.addToHistory,
    required this.clearHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.push(context,
              MaterialPageRoute(
                builder: (_) => SettingsPage(
                  mode: mode,
                  updateMode: updateMode,
                  clearHistory: clearHistory,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () => Navigator.push(context,
              MaterialPageRoute(
                builder: (_) => HistoryPage(history: history),
              ),
            ),
          ),
        ],
      ),
      body: mode == CalculatorMode.basic
          ? BasicCalculator(addToHistory: addToHistory)
          : ScientificCalculator(addToHistory: addToHistory),
    );
  }
}
