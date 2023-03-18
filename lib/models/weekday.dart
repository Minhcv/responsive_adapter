import 'package:intl/intl.dart';

import '../utils/index.dart';
import 'expense.dart';

class WeekDay {
  String date;
  String weekDayName;
  int amount;
  int percent;

  WeekDay({
    required this.date,
    required this.weekDayName,
    this.amount = 0,
    this.percent = 0,
  });

  static List<WeekDay> weekExpense(DateTime today, List<Expense> expenseList) {
    int sumTotal = 0;
    List<WeekDay> result = [];

    for (int i = 6; i >= 0; i--) {
      DateTime date = today.subtract(Duration(days: i));
      sumTotal += expenseList.fold(
          0,
          (prev, e) => (DateFormat('dd-MM-yyyy').format(e.date) ==
                  DateFormat('dd-MM-yyyy').format(date)
              ? prev + e.amount
              : prev + 0));
    }

    for (int i = 6; i >= 0; i--) {
      DateTime date = today.subtract(Duration(days: i));
      int totalPerDay = expenseList.fold(
          0,
          (prev, e) => (DateFormat('dd-MM-yyyy').format(e.date) ==
                  DateFormat('dd-MM-yyyy').format(date)
              ? prev + e.amount
              : prev + 0));

      result.add(WeekDay(
          date: DateFormat('dd-MM-yyyy').format(date),
          weekDayName: convertDate(
              DateFormat('EEEE').format(today.subtract(Duration(days: i)))),
          amount: totalPerDay,
          percent: expenseList.isNotEmpty
              ? (totalPerDay / sumTotal * 100).toInt()
              : 0));
    }
    return result;
  }
}
