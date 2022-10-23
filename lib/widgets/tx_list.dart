import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'tx_card.dart';

class TXList extends StatelessWidget {
  final List<Transaction> _userTXList;

  const TXList(this._userTXList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _userTXList.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions Yet...",
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
                const SizedBox(height: 20,),
                const Expanded(
                  child: Image(
                    image: AssetImage('assets/images/waiting.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, id) => TXCard(_userTXList[id]),
              itemCount: _userTXList.length,
            ),
    );
  }
}
