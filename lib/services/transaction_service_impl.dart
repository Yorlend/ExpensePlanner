import 'dart:async';

import 'transaction_service.dart';
import '../models/transaction.dart';
import '../models/stat_set.dart';

class TransactionServiceImpl implements TransactionService {
  final txController = StreamController<List<Transaction>>();
  final List<Transaction> transactions = [];

  final statController = StreamController<StatSet>();

  @override
  void onSubmit(String title, String amount, DateTime date) {
    if (title.isEmpty) {
      return;
    }

    double amountValue = -1;

    try {
      amountValue = double.parse(amount);
    } catch (e) {
      /// TODO: alert user
      return;
    }
    if (amountValue <= 0) {
      return;
    }

    var tx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amountValue,
      date: date,
    );

    transactions.add(tx);
    txController.add(transactions);

    calcLastWeekData();
  }

  @override
  void onDelete(String id) {
    transactions.removeWhere((tx) => tx.id == id);
    txController.add(transactions);

    calcLastWeekData();
  }

  @override
  Stream<List<Transaction>> get data {
    return txController.stream;
  }

  @override
  Stream<StatSet> get lastWeekData {
    return statController.stream;
  }

  void calcLastWeekData() {
    final recent = transactions.where((tx) {
      return tx.getDate().isAfter(
            DateTime.now().subtract(
              const Duration(days: 7),
            ),
          );
    });

    double total = 0.0;
    final stats = StatSet();
    for (var tx in recent) {
      total += tx.amount;
      var weekDay = tx.getDate().weekday - 1;
      stats[weekDay].addAmount(tx.amount);
    }

    stats.recalculateParts(total);
    statController.add(stats);
  }
}
