import 'package:flutter/material.dart';
import 'package:bruh/tests/sources/home.dart';
import 'package:bruh/tests/sources/expenses.dart';

void main() => runApp(const BudgetTrackerApp());

class BudgetTrackerApp extends StatefulWidget {
  const BudgetTrackerApp({Key? key}) : super(key: key);

  @override
  State<BudgetTrackerApp> createState() => _BudgetTrackerAppState();
}

class _BudgetTrackerAppState extends State<BudgetTrackerApp> {
  int budget = 50000;
  List<Item> items = [];

  void updateBudget(List<Item> updatedItems) {
    int totalCost = 0;
    for (var item in updatedItems) {
      totalCost += item.price;
    }
    setState(() {
      budget = 50000 - totalCost;
      items = updatedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(budget: budget),
        '/expenses': (context) => Expenses(
          items: items,
          updateBudget: updateBudget,
          budget: budget,
        ),
      },
    );
  }
}
