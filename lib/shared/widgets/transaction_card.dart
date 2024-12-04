import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/features/transactions/models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final Brightness brightness;

  const TransactionCard({
    Key? key,
    required this.transaction,
    required this.brightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String description;
    IconData icon;

    switch (transaction.type) {
      case 'deposit':
        description = 'Depósito de';
        icon = Icons.arrow_downward;
        break;
      case 'withdrawal':
        description = 'Retiro de';
        icon = Icons.arrow_upward;
        break;
      case 'send':
        description = 'Envío de';
        icon = Icons.send;
        break;
      case 'convert':
        description = 'Conversión de';
        icon = Icons.swap_horiz;
        break;
      default:
        description = 'Transacción';
        icon = Icons.monetization_on;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primaryText(brightness)),
              const SizedBox(width: 8),
              Text(
                '$description \$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: AppColors.primaryText(brightness),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
            style: TextStyle(
              color: AppColors.secondaryText(brightness),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
} 