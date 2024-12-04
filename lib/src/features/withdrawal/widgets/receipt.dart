import 'package:flutter/material.dart';
import 'package:pesa/src/features/withdrawal/models/withdrawal.dart';

class Receipt extends StatelessWidget {
  final Withdrawal withdrawal;
  final VoidCallback goToNext;

  const Receipt({
    Key? key,
    required this.withdrawal,
    required this.goToNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Receipt for Withdrawal of ${withdrawal.amount}'),
        ElevatedButton(
          onPressed: goToNext,
          child: Text('Finish'),
        ),
      ],
    );
  }
} 