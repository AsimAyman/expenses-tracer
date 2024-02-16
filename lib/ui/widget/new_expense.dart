import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  NewExpense(this.addExpense, {super.key});

  final void Function(Expense) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  TextEditingController _titleController = TextEditingController();

  TextEditingController _amountController = TextEditingController();
  var _selectedDate;
  Category category = Category.work;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.title),
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: _amountController,
            maxLength: 5,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.monetization_on_outlined),
              prefixText: '\$',
              label: Text('amount'),
            ),
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              TextButton.icon(
                onPressed: ()async {
                  var now = DateTime.now();
                 var date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(now.year - 1),
                    lastDate: DateTime(now.year + 1),
                    initialDate: now,

                  );
                 setState(() {
                   _selectedDate =date;
                 });
                },
                icon: Icon(Icons.date_range),
                label: Text('date'),
              ),
              DropdownButton(
                value: category,
                items: const [
                  DropdownMenuItem(
                    value: Category.work,
                    child: Text('work'),
                  ),
                  DropdownMenuItem(
                    value: Category.fun,
                    child: Text('fun'),
                  ),
                  DropdownMenuItem(
                    value: Category.charity,
                    child: Text('Charity'),
                  ),
                  DropdownMenuItem(
                    value: Category.food,
                    child: Text('food'),
                  ),
                ],
                onChanged: (newCategory) {
                  setState(() {
                    category = newCategory!;
                  });
                },
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('cancel'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .01,
            ),
            ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  String? title = _titleController.text;
                  double? amount = double.tryParse(_amountController.text);
                  if (title == null || amount == null) {
                    showDialog(
                      context: context,
                      builder: (c) => AlertDialog(
                        title: const Text("Invalid Inputs"),
                        content:
                            const Text('There is one file or more is empty'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Ok'))
                        ],
                      ),
                    );
                  } else {
                    Expense nwExpense = Expense(
                        title: title,
                        amount: amount,
                        category: category,
                        date: _selectedDate);
                    widget.addExpense(nwExpense);
                    Navigator.of(context).pop();
                  }
                }),
          ]),
        ]),
      ),
    );
  }
}
