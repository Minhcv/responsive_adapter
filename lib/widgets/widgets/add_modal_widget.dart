import 'package:flutter/material.dart';

class AddModal extends StatelessWidget {
  final dynamic titleController;
  final dynamic amountController;
  final Function addExpense;
  final Function setExpenseDate;
  const AddModal(
      {super.key,
      required this.titleController,
      required this.amountController,
      required this.addExpense,
      required this.setExpenseDate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                TextField(
                  controller: amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                      );
                      setExpenseDate(selectedDate);
                    },
                    child: const Text('Choose date')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      child: const Text('Save'),
                      onPressed: () {
                        addExpense();
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
