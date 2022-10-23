import 'transaction_stat.dart';

class StatSet {
  final List<TransactionStat> _stats = [];

  StatSet() {
    for (int i = 0; i < 7; i++) {
      _stats.add(TransactionStat(i, 0, 0));
    }
  }

  TransactionStat operator [](int index) {
    return _stats[index];
  }

  void recalculateParts(double sum) {
    for (var stat in _stats) {
      stat.recalculatePart(sum);
    }
  }
}