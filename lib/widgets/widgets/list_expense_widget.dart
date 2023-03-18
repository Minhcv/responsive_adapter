import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/expense.dart';

class ListExpense extends StatelessWidget {
  final List<Expense> expenseList;
  final Function deleteExpense;
  const ListExpense(
      {super.key, required this.expenseList, required this.deleteExpense});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: expenseList.length,
          itemBuilder: (context, index) {
            final expense = expenseList[index];
            return Item(
              expense: expense,
              deleteExpense: deleteExpense,
            );
          }),
    );
  }
}

class Item extends StatelessWidget {
  final Expense expense;
  final Function deleteExpense;
  const Item({super.key, required this.expense, required this.deleteExpense});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: const Color(0xFFffffff),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 1.0, offset: Offset(0, 2))
        ],
      ),
      child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Theme.of(context).primaryColor),
            child: Text(
              '${expense.amount}K',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(
            expense.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          subtitle: Text(DateFormat('dd-MM-yyyy').format(expense.date)),
          trailing: IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              deleteExpense(expense.id);
            },
          )),
    );
  }
}
