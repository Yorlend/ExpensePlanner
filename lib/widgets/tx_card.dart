import 'dart:ui';

import 'package:expense_planner/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/transaction.dart';

class TXCard extends StatelessWidget {
  final Transaction _tx;

  TXCard(Transaction tx) : _tx = tx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${_tx.amount}'),
            ),
          ),
        ),
        title: Text(
          _tx.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        subtitle: Text(
          _tx.date,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => GetIt.I.get<TransactionService>().onDelete(_tx.id),
        ),
      ),
    );
  }
}
