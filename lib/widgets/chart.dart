import 'package:flutter/material.dart';

import 'stat_bar.dart';
import '../models/stat_set.dart';

class Chart extends StatelessWidget {
  final StatSet _stats;

  const Chart(this._stats, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            FittedBox(
              child: Text(
                'Spent last week: \$${_stats.total}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ..._stats.data.map(
                  (stat) => StatBar(stat),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
