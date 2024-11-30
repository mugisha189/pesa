import 'package:flutter/material.dart';

enum TabType { email, phone }

class ResetServices {
  String? phoneNumber;
  String? email;

  final ValueNotifier<TabType> currentTab =
      ValueNotifier<TabType>(TabType.phone);

  void toggleTab() {
    currentTab.value =
        currentTab.value == TabType.phone ? TabType.email : TabType.phone;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "El número de celular es obligatorio.";
    }
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return "Introduce un número válido de 10 dígitos.";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "El correo electrónico es obligatorio.";
    }
    if (!RegExp(r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return "Introduce un correo electrónico válido.";
    }
    return null;
  }

  void submit(void Function()? callback) {
    // TODO: Handle the actual login process (API call, etc.)
    debugPrint("Phone Number: $phoneNumber");
    debugPrint("Email: $email");
    callback?.call();
  }
}
