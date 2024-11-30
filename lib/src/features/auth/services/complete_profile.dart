import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileServices {
  String? fullName;
  String? surname;
  String? phoneNumber;
  String? password;
  String? dateOfBirth;

  ValueNotifier<File?> selectedImage = ValueNotifier<File?>(null);

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
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

  String? validateSurname(String? value) {
    if (value == null || value.isEmpty) {
      return "El apellido es obligatorio.";
    }
    if (value.length < 3) {
      return "El apellido debe tener al menos 3 caracteres.";
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

  String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return "La fecha de nacimiento es obligatoria.";
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
    callback?.call();
  }
}
