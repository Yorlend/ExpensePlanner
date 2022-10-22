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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expensationeer',
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
    );
  }
}
