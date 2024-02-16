import 'package:expenses/models/expense.dart';
import 'package:expenses/ui/widget/card_item.dart';
import 'package:flutter/material.dart';

class ExpensesListView extends StatelessWidget {
  ExpensesListView({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final List<Expense> expenses;
  void Function(Expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return expenses.isEmpty? Center(child: Text('Add your first Expense')):ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        },
        child: CardItem(
          title: expenses[index].title,
          amount: expenses[index].amount,
          date: expenses[index].date,
          icon: categoryIcon[expenses[index].category],
        ),
      ),
    );
  }
}
