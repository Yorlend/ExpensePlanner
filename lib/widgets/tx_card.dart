import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TXCard extends StatelessWidget {
  final Transaction _tx;

  TXCard(Transaction tx) : _tx = tx;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            child: Text(
              '\$${_tx.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_tx.title, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).primaryColorDark,
              ),),
              Text(_tx.date, style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                color: Colors.grey,
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
