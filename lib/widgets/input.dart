import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final Function(String, String) submitHandler;

  Input(this.submitHandler, {super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                label: Text('Amount'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.purple),
                ),
                onPressed: () {
                  widget.submitHandler(
                    titleController.text,
                    amountController.text,
                  );
                  titleController.clear();
                  amountController.clear();
                },
                child: const Text(
                  'Submit Transaction',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
