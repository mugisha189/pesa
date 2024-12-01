import 'package:flutter/material.dart';
import 'package:pesa/shared/images.dart';

class FunctionsServices {
  final List<Map<String, dynamic>> functions = [
    {'name': 'Enviar', 'icon': AppImages.sendIcon},
    {'name': 'Solicitar', 'icon': AppImages.sendIcon},
    {'name': 'Recargar', 'icon':AppImages.sendIcon},
    {'name': 'Retirar', 'icon': AppImages.sendIcon},
    {'name': 'Convertir', 'icon': AppImages.sendIcon},
    {'name': 'Añadir cuenta', 'icon': AppImages.sendIcon},
  ];

  void onFunctionTap(BuildContext context, String functionName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$functionName tapped'),
      ),
    );
  }
}
