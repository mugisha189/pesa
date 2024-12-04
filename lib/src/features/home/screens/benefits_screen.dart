import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/images.dart';
import 'package:pesa/shared/widgets/gradient_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
class BenefitsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackground(brightness),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.benefitsPointsIcon,
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Puntos acumulados',
                      style: TextStyle(
                        color: AppColors.primaryText(brightness),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '1,000',
                      style: TextStyle(
                        color: AppColors.primaryText(brightness),
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GradientText(
                      text: 'Ver opciones de canje',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.tertiary(brightness),
                          AppColors.quaternary(brightness),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      AppImages.ads,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
