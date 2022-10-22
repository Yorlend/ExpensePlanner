import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'tx_card.dart';

class TXList extends StatelessWidget {
  
  final List<Transaction> _userTXList;

  const TXList(this._userTXList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemBuilder: (ctx, id) => TXCard(_userTXList[id]),
          itemCount: _userTXList.length,
      ),
    );
  }
}
