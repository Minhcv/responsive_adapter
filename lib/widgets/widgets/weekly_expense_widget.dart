import 'package:flutter/material.dart';

import '../../models/weekday.dart';

class WeeklyExpenese extends StatelessWidget {
  final List<WeekDay> weekExpense;
  final bool islandscape;
  const WeeklyExpenese(
      {super.key, required this.weekExpense, required this.islandscape});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: islandscape ? MediaQuery.of(context).size.height - 100 : 200,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFffffff),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
            offset: Offset(
              1.0, // Move to right 5  horizontally
              1.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [for (WeekDay item in weekExpense) weekItem(context, item)],
      ),
    );
  }
}

SizedBox weekItem(context, weekDay) {
  return SizedBox(
    width: 40,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${weekDay.amount}K',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              color: const Color.fromARGB(255, 206, 205, 205),
              height: 100,
              width: 15,
            ),
            Container(
              color: Theme.of(context).primaryColor,
              height: weekDay.percent.toDouble(),
              width: 15,
            )
          ],
        ),
        Text(weekDay.weekDayName,
            style: Theme.of(context).textTheme.headlineLarge),
        Text('${weekDay.date.split('-')[0]}-${weekDay.date.split('-')[1]}'),
      ],
    ),
  );
}
