import '../models/transaction.dart';

abstract class TransactionService {
  void onSubmit(String title, String amount);

  Stream<List<Transaction>> get data;
}