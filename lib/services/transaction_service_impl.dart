import 'dart:async';

import 'transaction_service.dart';
import '../models/transaction.dart';

class TransactionServiceImpl implements TransactionService {
  final txController = StreamController<List<Transaction>>();
  final List<Transaction> transactions = [];
  
  @override
  void onSubmit(String title, String amount) {
    if (title.isEmpty) {
      return;
    }
    
    double amountValue = double.parse(amount);
    if (amountValue <= 0) {
      return;
    }

    var tx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amountValue,
      date: DateTime.now(),
    );

    transactions.add(tx);
    txController.add(transactions);
  }

  @override
  Stream<List<Transaction>> get data {
    return txController.stream;
  }
}