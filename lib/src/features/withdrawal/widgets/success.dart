import 'package:flutter/material.dart';
import 'package:pesa/src/features/withdrawal/models/withdrawal.dart';

class Success extends StatelessWidget {
  final Withdrawal withdrawal;
  final VoidCallback goToNext;

  const Success({
    Key? key,
    required this.withdrawal,
    required this.goToNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Withdrawal Successful: ${withdrawal.amount}'),
        ElevatedButton(
          onPressed: goToNext,
          child: Text('Done'),
        ),
      ],
    );
  }
} 