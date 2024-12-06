import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';

class ChoosingPaymentMethod extends StatelessWidget {
  final String type;
  final VoidCallback goToNext;

  const ChoosingPaymentMethod({
    Key? key,
    required this.type,
    required this.goToNext,
  }) : super(key: key);

  List<Map<String, String>> _getPaymentOptions(String type) {
    if (type == "deposit") {
      return [
        {
          "title": "Transferencia bancaria",
          "currency": "USD",
          "description": "Llegaría en: 0-1 días",
          "icon": "assets/images/america.png",
        },
        {
          "title": "Tarjeta de crédito",
          "currency": "USD",
          "description": "Llegaría en: Al instante",
          "icon": "assets/images/america.png",
        },
        {
          "title": "Entrega de efectivo",
          "currency": "USD",
          "description": "Llegaría en: Al instante",
          "icon": "assets/images/america.png",
        },
        {
          "title": "Criptomonedas (para expertos)",
          "currency": "USD",
          "description": "Llegaría en: Al instante",
          "icon": "assets/images/america.png",
        },
      ];
    } else {
      return [
        {
          "title": "Transferencia bancaria",
          "currency": "USD",
          "description": "Procesado en: 1-2 días",
          "icon": "assets/images/america.png",
        },
        {
          "title": "Recoger efectivo",
          "currency": "USD",
          "description": "Procesado en: Al instante",
          "icon": "assets/images/america.png",
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final paymentOptions = _getPaymentOptions(type);
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        title: Text(
          'Elegir método de ${type == "deposit" ? "recarga" : "retiro"}',
          style: TextStyle(
            color: AppColors.primaryText(brightness),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText(brightness),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColors.primaryBackground(brightness),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: paymentOptions.map((option) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackground(brightness),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  onTap: goToNext,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              option["title"]!,
                              style: TextStyle(
                                color: AppColors.primaryText(brightness),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              option["currency"]!,
                              style: TextStyle(
                                color: AppColors.primary(brightness),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              option["description"]!,
                              style: TextStyle(
                                  color: AppColors.secondaryText(brightness),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Image.asset(option["icon"]!, height: 40, width: 40),
                      ]),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
