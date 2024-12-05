import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/app/routes.dart';

class Receipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: AppColors.primaryText(brightness)),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColors.primaryBackground(brightness),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:  AppColors.secondaryBackground(brightness),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$500.00',
                  style: TextStyle(
                    color: AppColors.primaryText(brightness),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Recarga completada',
                  style: TextStyle(
                    color: AppColors.primaryText(brightness),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Jan 11, 2024, 03:37:52 pm',
                  style: TextStyle(
                    color: AppColors.secondaryText(brightness),
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBackground(brightness),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Desde',
                        style: TextStyle(
                          color: AppColors.secondaryText(brightness),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Tarjeta de crédito',
                        style: TextStyle(
                          color: AppColors.primaryText(brightness),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Hacia',
                        style: TextStyle(
                          color: AppColors.secondaryText(brightness),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Cuenta en USD',
                        style: TextStyle(
                          color: AppColors.primaryText(brightness),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '345678901234567',
                        style: TextStyle(
                          color: AppColors.primaryText(brightness),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ID de transacción',
                      style: TextStyle(
                        color: AppColors.secondaryText(brightness),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '3251039750025',
                      style: TextStyle(
                        color: AppColors.primaryText(brightness),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Comisiones',
                      style: TextStyle(
                        color: AppColors.secondaryText(brightness),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Gratis',
                      style: TextStyle(
                        color: AppColors.primaryText(brightness),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nota',
                      style: TextStyle(
                        color: AppColors.secondaryText(brightness),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Recarga mensual',
                      style: TextStyle(
                        color: AppColors.primaryText(brightness),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary(brightness),
                          AppColors.secondary(brightness),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.home);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // Transparent to allow gradient
                        shadowColor: Colors.transparent, // Removes button shadow
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        "Regresar a Inicio",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.tertiaryText(brightness),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
