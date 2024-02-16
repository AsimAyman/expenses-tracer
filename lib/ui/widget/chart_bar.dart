import 'package:flutter/material.dart';

class CharBar extends StatelessWidget {
  const CharBar({
    super.key,
    required this.fill,
    required this.icon,
  });

  final fill;
  final icon;

  @override
  Widget build(BuildContext context) {
    return

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FractionallySizedBox(

              heightFactor: fill,
              child: Container(
                width: 1,
                decoration:  BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                          topRight:Radius.circular(12) ,
                          topLeft: Radius.circular(12)
                  ),
                ),
              ),
            ),
          ),
        );
  }
}
