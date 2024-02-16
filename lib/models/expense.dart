import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Category { work, fun, charity, food }

var categoryIcon = {
  Category.work: Icons.work,
  Category.fun: Icons.interests_outlined,
  Category.charity: Icons.chair_alt,
  Category.food: Icons.fastfood_outlined
};

Uuid uuid = Uuid();

class Expense {
  final String title;
  final double amount;
  final Category category;
  final DateTime date;
  final id;

  Expense(
      {required this.title,
      required this.amount,
      required this.category,
      required this.date})
      : id = uuid.v1();
}

class ExpenseBucket {
  var expenses;

  ExpenseBucket(this.expenses);

  ExpenseBucket.category(List allExpenses, Category category)
      : expenses = allExpenses.where((element) => element.category == category);

  double get categoryExpenses {
    double total = 0;
    for (var i in expenses) {
      total += i.amount;
    }
    return total;
  }

  double get totalMax {
    double totalMax = 0;
    for (var i in expenses) {
      totalMax += i.amount;
    }
    return totalMax;
  }
}
