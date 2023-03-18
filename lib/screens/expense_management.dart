import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../models/weekday.dart';
import '../widgets/widgets/add_modal_widget.dart';
import '../widgets/widgets/list_expense_widget.dart';
import '../widgets/widgets/weekly_expense_widget.dart';

final List<Expense> expenseListInit = [
  Expense(id: '1', title: 'Buy a new car', amount: 30, date: DateTime.now()),
  Expense(
      id: '2',
      title: 'Eating',
      amount: 50,
      date: DateTime.now().subtract(const Duration(days: 1))),
  Expense(
      id: '3',
      title: 'Playing football',
      amount: 40,
      date: DateTime.now().subtract(const Duration(days: 2))),
  Expense(
      id: '4',
      title: 'Hangout with friends',
      amount: 10,
      date: DateTime.now().subtract(const Duration(days: 3))),
  Expense(
      id: '5',
      title: 'Buy some food',
      amount: 90,
      date: DateTime.now().subtract(const Duration(days: 4))),
];

class ExpenseManagement extends StatefulWidget {
  const ExpenseManagement({super.key});

  @override
  State<ExpenseManagement> createState() => _ExpenseManagementState();
}

class _ExpenseManagementState extends State<ExpenseManagement> {
  // STATE

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime dateSelected = DateTime.now();
  bool _isShowChart = true;

  List<WeekDay> weekExpense =
      WeekDay.weekExpense(DateTime.now(), expenseListInit);

  List<Expense> expenseList = expenseListInit;

  // FUNCTION
  _setExpenseDate(date) {
    if (date == null) {
    } else {
      setState(() {
        dateSelected = date;
      });
    }
  }

  _deleteExpense(id) {
    setState(() {
      expenseList.removeWhere((item) => item.id == id);
      weekExpense = WeekDay.weekExpense(DateTime.now(), expenseList);
    });
  }

  _addExpense() {
    if (_titleController.text.isEmpty || _amountController.text.isEmpty) {
    } else {
      setState(() {
        expenseList.add(Expense(
            id: DateTime.now().microsecond.toString(),
            title: _titleController.text,
            amount: int.parse(_amountController.text),
            date: dateSelected));
        weekExpense = WeekDay.weekExpense(DateTime.now(), expenseList);
      });
    }

    setState(() {
      _titleController.clear();
      _amountController.clear();
      dateSelected = DateTime.now();
    });
  }

  _showChart() {
    setState(() {
      _isShowChart = !_isShowChart;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool islandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: appBarCustom(
          context,
          _titleController,
          _amountController,
          dateSelected,
          _addExpense,
          _setExpenseDate,
          islandscape,
          _showChart,
          _isShowChart),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(
              color: Colors.blue,
              child: !islandscape
                  ? Column(children: [
                      WeeklyExpenese(
                          weekExpense: weekExpense, islandscape: islandscape),
                      ListExpense(
                          expenseList: expenseList,
                          deleteExpense: _deleteExpense),
                    ])
                  : Column(children: [
                      _isShowChart
                          ? WeeklyExpenese(
                              weekExpense: weekExpense,
                              islandscape: islandscape)
                          : ListExpense(
                              expenseList: expenseList,
                              deleteExpense: _deleteExpense),
                    ]));
        },
      ),
    );
  }
}

AppBar appBarCustom(context, titleController, amountController, dateSelected,
    addExpense, setExpenseDate, islandscape, showChart, isShowChart) {
  return AppBar(
      title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Expense Management',
        style: Theme.of(context).textTheme.displaySmall,
      ),
      Row(
        children: [
          islandscape
              ? IconButton(
                  onPressed: showChart,
                  icon: Icon(isShowChart ? Icons.menu : Icons.insert_chart,
                      color: Theme.of(context).secondaryHeaderColor))
              : Container(),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return AddModal(
                        titleController: titleController,
                        amountController: amountController,
                        addExpense: addExpense,
                        setExpenseDate: setExpenseDate,
                      );
                    });
              },
              icon: Icon(Icons.add,
                  color: Theme.of(context).secondaryHeaderColor)),
        ],
      ),
    ],
  ));
}
