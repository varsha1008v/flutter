import 'package:flutter/material.dart';
import 'main.dart';

class SettingsPage extends StatelessWidget {
  final CalculatorMode mode;
  final void Function(CalculatorMode) updateMode;
  final VoidCallback clearHistory;

  const SettingsPage({super.key, 
    required this.mode,
    required this.updateMode,
    required this.clearHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Column(
        children: [
          ListTile(
            title: Text("Calculator Mode"),
            subtitle: Text(mode == CalculatorMode.basic ? "Basic" : "Scientific"),
            trailing: DropdownButton<CalculatorMode>(
              value: mode,
              items: [
                DropdownMenuItem(value: CalculatorMode.basic, child: Text("Basic")),
                DropdownMenuItem(value: CalculatorMode.scientific, child: Text("Scientific")),
              ],
              onChanged: (newMode) {
                if (newMode != null) {
                  updateMode(newMode);
                  Navigator.pop(context);
                }
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Clear History"),
            trailing: Icon(Icons.delete),
            onTap: () {
              clearHistory();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
