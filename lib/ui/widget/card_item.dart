import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardItem extends StatelessWidget {
  CardItem({super.key, this.title, this.amount, this.date, this.icon});

  final title;
  final amount;
  final date;
  final icon;
  var format = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: Card(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(title.toString()), Text(amount.toString())],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  format.format(date).toString(),
                ),
                Icon(icon),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
