import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() => runApp(const ExpensePlanner());

class ExpensePlanner extends StatelessWidget {
  const ExpensePlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      home: HomePage(),
    );
  }
}
