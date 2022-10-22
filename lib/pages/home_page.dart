import 'package:flutter/material.dart';

import '../widgets/user_tx.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Card(
            color: Colors.blue,
            elevation: 5,
            child: Text('Chart'),
          ),
          UserTX(),
        ],
      ),
    );
  }
}
