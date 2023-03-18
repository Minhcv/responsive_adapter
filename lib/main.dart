import 'package:flutter/material.dart';

import 'screens/expense_management.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Section 4',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          secondaryHeaderColor: Colors.white,
          textTheme: const TextTheme(
            displaySmall: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            headlineLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
      home: const ExpenseManagement(),
    );
  }
}
