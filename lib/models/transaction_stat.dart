class TransactionStat {
  final int _weekDay;
  double _totalAmount;
  double _part;

  TransactionStat(this._weekDay, this._totalAmount, this._part);

  int get weekDay {
    return _weekDay;
  }

  double get amount {
    return _totalAmount;
  }

  double get part {
    return _part;
  }

  void addAmount(double delta) {
    _totalAmount += delta;
  }

  void recalculatePart(double sum) {
    _part = _totalAmount / sum;
  }
}