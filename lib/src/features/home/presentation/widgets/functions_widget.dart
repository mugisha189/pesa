import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/images.dart';
import 'package:pesa/src/features/home/services/functions.dart';

class FunctionsWidget extends StatelessWidget {
  final FunctionsServices services = FunctionsServices();

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
        color: AppColors.primaryText(brightness),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Funciones más usadas',
            style: TextStyle(
              color: AppColors.tertiaryText(brightness),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: services.functions.length,
              itemBuilder: (context, index) {
                final function = services.functions[index];
                return GestureDetector(
                  onTap: () =>
                      services.onFunctionTap(context, function['name']),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.tertiaryBackground(brightness),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          function['icon'],
                          height: 30,
                          width: 30,
                          color: Colors.grey[800],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          function['name'],
                          style: TextStyle(
                            color: AppColors.tertiaryText(brightness),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
