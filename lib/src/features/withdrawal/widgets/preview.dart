import 'package:flutter/material.dart';
import 'package:pesa/src/features/withdrawal/models/withdrawal.dart';

class Preview extends StatelessWidget {
  final Withdrawal withdrawal;
  final VoidCallback goToNext;

  const Preview({
    Key? key,
    required this.withdrawal,
    required this.goToNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Preview Withdrawal of ${withdrawal.amount} using ${withdrawal.method}'),
        ElevatedButton(
          onPressed: goToNext,
          child: Text('Confirm'),
        ),
      ],
    );
  }
} 