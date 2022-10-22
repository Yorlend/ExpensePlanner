import 'package:intl/intl.dart';

class Transaction {
  final String _id;
  final String _title;
  final double _amount;
  final DateTime _date;

  Transaction({
    required String id,
    required String title,
    required double amount,
    required DateTime date,
  })  : _id = id,
        _title = title,
        _amount = amount,
        _date = date;

  String get title {
    return _title;
  }

  String get id {
    return _id;
  }

  double get amount {
    return _amount;
  }

  String get date {
    return DateFormat('yMMMMd').format(_date);
  }

  DateTime getDate() {
    return _date;
  }
}
