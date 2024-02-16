import 'package:expenses/ui/widget/chart_bar.dart';
import 'package:expenses/ui/widget/chart.dart';
import 'package:expenses/ui/widget/expenses_listview.dart';
import 'package:expenses/ui/widget/new_expense.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
   List<Expense> expenses = [
    Expense(
        title: "papers",
        amount: 212,
        category: Category.work,
        date: DateTime.now()),
    Expense(
        title: "tee",
        amount: 23,
        category: Category.food,
        date: DateTime.now()),
    Expense(
      title: "donations",
      amount: 42,
      category: Category.charity,
      date: DateTime.now(),
    ),
  ];

  void addExpense(expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void removeExpense(expense) {
    setState(() {
      expenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracer'),
        centerTitle: true,
      ),
      body: size.width <600?
      Column(
        children: [
          Expanded(
            flex: 1,
            child: Chart(expenses),
          ),
          Expanded(
            flex: 3,
            child: ExpensesListView(
                expenses: expenses, removeExpense: removeExpense),
          ),
        ],
      ):  Row(
        children: [
          Expanded(
            flex: 2,
            child: Chart(expenses),
          ),
          Expanded(
            flex: 3,
            child: ExpensesListView(
                expenses: expenses, removeExpense: removeExpense),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (c) => NewExpense(addExpense));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



