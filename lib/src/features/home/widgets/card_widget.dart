import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/images.dart';
import 'package:pesa/src/app/routes.dart';
import 'package:pesa/src/features/home/widgets/convert_widget.dart';

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
  final bool showButtons;

  const CardWidget({Key? key, required this.cardData, this.showButtons = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showConvertModal() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return const ConvertWidget();
        },
      );
    }

    final brightness = Theme.of(context).brightness;
    final buttonData = [
      {
        'label': 'Enviar',
        'iconPath': AppImages.sendIcon,
        'onPressed': () {
          Navigator.pushNamed(context, AppRoutes.send);
        },
      },
      {
        'label': 'Retirar',
        'iconPath': AppImages.withdrawIcon,
        'onPressed': () {
          Navigator.pushNamed(context, AppRoutes.withdrawal);
        },
      },
      {
        'label': 'Recargar',
        'iconPath': AppImages.depositIcon,
        'onPressed': () {
          print('Recargar action triggered');
        },
      },
      {
        'label': 'Solicitar',
        'iconPath': AppImages.convertIcon2,
        'onPressed': () {
          _showConvertModal();
        },
      },
    ];

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.9,
          ),
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
              if (showButtons)
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
                              onPressed: data['onPressed'] as VoidCallback,
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
