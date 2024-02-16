import 'package:expenses/models/expense.dart';
import 'package:expenses/ui/widget/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart(
    this.expenses, {
    super.key,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    double totalExpenses = ExpenseBucket(expenses).totalMax;

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 175,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (var i in Category.values)
                  Container(
                    width: MediaQuery.of(context).size.width * .10,
                    child: CharBar(
                        fill: ExpenseBucket.category(expenses, i)
                                    .categoryExpenses ==
                                0
                            ? 0
                            : ExpenseBucket.category(expenses, i)
                                    .categoryExpenses /
                                totalExpenses,
                        icon: categoryIcon[i]),
                  ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [for (var i in Category.values) Icon(categoryIcon[i])],
          )
        ],
      ),
    );
  }
}
