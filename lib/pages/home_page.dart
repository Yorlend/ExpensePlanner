import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../widgets/tx_list.dart';
import '../dialogs/input_dialog.dart';
import '../services/transaction_service.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expensationeer'),
        actions: [
          IconButton(
            onPressed: () => showAddTransactionDialog(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            color: Colors.blue,
            elevation: 5,
            child: Text('Chart'),
          ),
          StreamBuilder(
            initialData: [],
            stream: GetIt.instance.get<TransactionService>().data,
            builder: ((context, snapshot) => TXList(snapshot.data!.cast<Transaction>())),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showAddTransactionDialog(context),
      ),
    );
  }
}
