import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/images.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hola,',
                        style: TextStyle(
                          color: AppColors.secondaryText(brightness),
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Francisco Gonzalez',
                        style: TextStyle(
                          color: AppColors.primaryText(brightness),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.settings,
                      color: AppColors.primaryText(brightness)),
                ],
              ),
              SizedBox(height: 20),

              // Balance Card
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground(brightness),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'USD',
                          style: TextStyle(
                            color: AppColors.secondaryText(brightness),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$250.00',
                          style: TextStyle(
                            color: AppColors.primaryText(brightness),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Image(image: AssetImage(AppImages.americanFlag))
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _actionButton('Enviar', Icons.send,brightness),
                  _actionButton('Retirar', Icons.money,brightness),
                  _actionButton('Recargar', Icons.add,brightness),
                  _actionButton('Solicitar', Icons.receipt,brightness),
                ],
              ),
              SizedBox(height: 20),

              // Cashback Banner
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.accent, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Obtén 1% de Cashback',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.thumb_up, color: Colors.white, size: 32),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Transactions Section
              Text(
                'Transacciones',
                style: TextStyle(
                  color: AppColors.primaryText(brightness),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    _transactionItem(
                        'Recepción de dinero', '+\$2,000', AppColors.green,brightness),
                    _transactionItem(
                        'Envío de dinero', '-\$20,000', AppColors.red,brightness),
                    _transactionItem(
                        'Envío de dinero', '-\$20,000', AppColors.red,brightness),
                    _transactionItem(
                        'Recepción de dinero', '+\$2,000', AppColors.green,brightness),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButton(String label, IconData icon,Brightness brightness) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.cardBackground(brightness),
          radius: 30,
          child: Icon(icon, color: AppColors.primaryText(brightness), size: 28),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: AppColors.primaryText(brightness),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _transactionItem(String title, String amount, Color amountColor,Brightness brightness) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(
                title,
                style: TextStyle(
                    color: AppColors.primaryText(brightness), fontSize: 16),
              ),
              Text(
                'Apr 18, 2024',
                style: TextStyle(
                    color: AppColors.secondaryText(brightness), fontSize: 12),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
                color: amountColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
