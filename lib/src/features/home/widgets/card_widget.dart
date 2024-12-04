import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/images.dart'; // Assuming this contains AppImages

class CardData {
  final String currency;
  final String amount;
  final String flagImage;

  CardData({
    required this.currency,
    required this.amount,
    required this.flagImage,
  });
}

class CardWidget extends StatelessWidget {
  final CardData cardData;

  const CardWidget({Key? key, required this.cardData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final buttonData = [
      {'label': 'Enviar', 'iconPath': AppImages.sendIcon},
      {'label': 'Retirar', 'iconPath': AppImages.withdrawIcon},
      {'label': 'Recargar', 'iconPath': AppImages.depositIcon},
      {'label': 'Solicitar', 'iconPath': AppImages.convertIcon2},
    ];

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.secondaryBackground(brightness),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardData.currency,
                style: TextStyle(
                  color: AppColors.primaryText(brightness),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                cardData.amount,
                style: TextStyle(
                  color: AppColors.primaryText(brightness),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: buttonData.map((data) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primary(brightness),
                                AppColors.secondary(brightness),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              data['iconPath'] as String,
                              color: AppColors.tertiaryText(brightness),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data['label'] as String,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primaryText(brightness),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Image.asset(
            cardData.flagImage,
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}
