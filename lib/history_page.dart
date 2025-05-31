import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> history;

  const HistoryPage({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculation History")),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(history[index]),
        ),
      ),
    );
  }
}
