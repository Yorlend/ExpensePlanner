import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../widgets/input.dart';
import '../services/transaction_service.dart';

void showAddTransactionDialog(BuildContext ctx) {
  showModalBottomSheet(context: ctx, builder: (bCtx) {
    return Input(
      GetIt
        .instance
        .get<TransactionService>()
        .onSubmit
    );
  });
}