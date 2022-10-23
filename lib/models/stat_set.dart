import 'transaction_stat.dart';

class StatSet {
  final List<TransactionStat> _stats = [];
  double _total = 0;

  StatSet() {
    for (int i = 0; i < 7; i++) {
      _stats.add(TransactionStat(i, 0, 0));
    }
  }

  TransactionStat operator [](int index) {
    return _stats[index];
  }

  List<TransactionStat> get data {
    return _stats;
  }

  String get total {
    return _total.toStringAsFixed(2);
  }

  void recalculateParts(double sum) {
    _total = sum;
    for (var stat in _stats) {
      stat.recalculatePart(sum);
    }
  }
}
