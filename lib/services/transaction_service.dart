import '../models/transaction.dart';
import '../models/stat_set.dart';

abstract class TransactionService {
  void onSubmit(String title, String amount, DateTime date);

  void onDelete(String id);

  Stream<List<Transaction>> get data;

  Stream<StatSet> get lastWeekData;
}