import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/images.dart';
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
    String icon;
    Color amountColor;
    String sign;

    // Determine description, icon, amount color, and sign based on transaction type
    switch (transaction.type) {
      case 'deposit':
        description = 'Recepción de dinero';
        icon = AppImages.depositIcon;
        amountColor = Colors.green;
        sign = '+';
        break;
      case 'withdrawal':
        description = 'Retiro de dinero';
        icon = AppImages.withdrawIcon;
        amountColor = Colors.red;
        sign = '-';
        break;
      case 'send':
        description = 'Envio de dinero';
        icon = AppImages.sendIcon;
        amountColor = Colors.red;
        sign = '-';
        break;
      case 'convert':
        description = 'Conversión de dinero';
        icon = AppImages.convertIcon2;
        amountColor = Colors.grey.shade300;
        sign = '';
        break;
      case 'recieved':
        description = 'Dinero recibido';
        icon = AppImages.depositIcon;
        amountColor = Colors.green;
        sign = '+';
        break;
      default:
        description = 'Transacción';
        icon = AppImages.sendIcon;
        amountColor = Colors.grey.shade300;
        sign = '';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Icon Container
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.primaryBackground(brightness),
            ),
            child: SvgPicture.asset(
              width: 25,
              height: 25,
              icon,
              color: AppColors.primaryText(brightness),
            ),
          ),
          const SizedBox(width: 8),
          // Details and Amount Row
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                          color: AppColors.primaryText(brightness),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                        style: TextStyle(
                          color: AppColors.secondaryText(brightness),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '$sign${transaction.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: amountColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
