import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/stat_set.dart';

class Chart extends StatelessWidget {
  final StatSet _stats;

  const Chart(this._stats, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Card(
            elevation: 10,
            child: Text('Dummy'),
          ),
        ],
      ),
    );
  }
}
