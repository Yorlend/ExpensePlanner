import 'package:flutter/material.dart';

import 'input.dart';
import '../models/transaction.dart';
import 'tx_list.dart';

class UserTX extends StatefulWidget {
  const UserTX({super.key});

  @override
  State<UserTX> createState() => _UserTXState();
}

class _UserTXState extends State<UserTX> {
  final List<Transaction> _userTX = [
  Transaction(
    id: 't1',
    title: 'New shoes',
    amount: 69.99,
    date: DateTime.now(),
  ),
  Transaction(
      id: 't2',
      title: 'Weekly groceries',
      amount: 16.53,
      date: DateTime.now()),
  ];

  void _onSubmit(String title, String amount) {
    try {
      double amountValue = double.parse(amount);
      setState(() {
        _userTX.add(Transaction(
          id: DateTime.now().toString(),
          title: title,
          amount: amountValue,
          date: DateTime.now(),
        ));
      });
    } catch (e) {
      const AlertDialog(
        content: Text('Exception occured'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Input(_onSubmit),
        TXList(_userTX), 
      ],
    );
  }
}