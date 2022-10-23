import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../dialogs/datepicker_dialog.dart';

class Input extends StatefulWidget {
  final Function(String, String, DateTime) submitHandler;

  const Input(this.submitHandler, {super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime _date = DateTime.now();

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
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      DateFormat('yMMMMd').format(_date),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDatePickerDialog(context).then((value) {
                        if (value != null) {
                          setState(() {
                            _date = value;
                          });
                        }
                      });
                    },
                    child: const Text('Choose Date'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: () {
                  widget.submitHandler(
                    titleController.text,
                    amountController.text,
                    _date,
                  );

                  Navigator.of(context).pop();
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
