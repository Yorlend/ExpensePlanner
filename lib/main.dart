import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'pages/home_page.dart';
import 'services/transaction_service.dart';
import 'services/transaction_service_impl.dart';

void main() {
  GetIt.instance.registerSingleton<TransactionService>(TransactionServiceImpl(),
      signalsReady: true);

  runApp(const ExpensePlanner());
}

class ExpensePlanner extends StatelessWidget {
  const ExpensePlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Planner',
      home: HomePage(),
    );
  }
}
