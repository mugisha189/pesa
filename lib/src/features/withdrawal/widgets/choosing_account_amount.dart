import 'package:flutter/material.dart';
import 'package:pesa/src/features/withdrawal/models/withdrawal.dart';

class ChoosingAccountAmount extends StatelessWidget {
  final Withdrawal withdrawal;
  final Function(double) onChange;
  final VoidCallback goToNext;

  const ChoosingAccountAmount({
    Key? key,
    required this.withdrawal,
    required this.onChange,
    required this.goToNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Amount'),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            double amount = double.tryParse(value) ?? 0.0;
            onChange(amount);
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