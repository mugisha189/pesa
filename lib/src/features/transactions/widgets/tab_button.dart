import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';

class TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Brightness brightness;

  const TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.brightness,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    AppColors.primary(brightness),
                    AppColors.secondary(brightness),
                  ], // Example gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.transparent : AppColors.primaryText(brightness),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.primaryBackground(brightness) : AppColors.primaryText(brightness),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
