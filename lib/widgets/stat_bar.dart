import 'package:flutter/material.dart';

import '../models/transaction_stat.dart';

class StatBar extends StatelessWidget {
  final TransactionStat _stat;

  const StatBar(this._stat, {super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: 20,
              child: FittedBox(
                child: Text('\$${_stat.amount.round()}'),
              ),
            ),
            Container(
              height: 60,
              width: 10,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: const Color.fromARGB(215, 191, 253, 194),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: _stat.part,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(_stat.weekAbbr),
          ],
        ),
      ),
    );
  }
}
