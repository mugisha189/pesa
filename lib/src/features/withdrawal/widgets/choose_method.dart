import 'package:flutter/material.dart';
import 'package:pesa/src/features/withdrawal/models/withdrawal.dart';

class ChooseMethod extends StatelessWidget {
  final Withdrawal withdrawal;
  final Function(String) onChange;
  final VoidCallback goToNext;

  const ChooseMethod({
    Key? key,
    required this.withdrawal,
    required this.onChange,
    required this.goToNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: withdrawal.method,
          items: <String>['Bank Transfer', 'Cash Pickup', 'Cryptocurrency']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onChange(value);
            }
          },
        ),
        ElevatedButton(
          onPressed: goToNext,
          child: Text('Next'),
        ),
      ],
    );
  }
} 