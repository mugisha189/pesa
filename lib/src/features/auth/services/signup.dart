import 'package:flutter/material.dart';

class SignupServices {
  String? fullName;
  String? phoneNumber;
  String? password;

  final ValueNotifier<bool> isPasswordHidden = ValueNotifier<bool>(true);

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return "El nombre completo es obligatorio.";
    }
    if (value.length < 3) {
      return "El nombre debe tener al menos 3 caracteres.";
    }
    return null;
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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "La contraseña es obligatoria.";
    }
    if (value.length < 6) {
      return "La contraseña debe tener al menos 6 caracteres.";
    }
    return null;
  }

  void submit(void Function()? callback) {
    // TODO: Handle the actual login process (API call, etc.)
    debugPrint("Phone Number: $phoneNumber");
    debugPrint("Password: $password");
    callback?.call();
  }
}
