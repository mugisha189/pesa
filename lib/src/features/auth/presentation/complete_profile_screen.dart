import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/app/routes.dart';
import 'package:pesa/src/features/auth/services/complete_profile.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final CompleteProfileServices _registerServices = CompleteProfileServices();

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: AppColors.primaryText(brightness)),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: AppColors.primaryBackground(brightness),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      "Completa tu perfil",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText(brightness),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: ValueListenableBuilder<File?>(
                      valueListenable: _registerServices.selectedImage,
                      builder: (context, selectedImage, _) {
                        return Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            selectedImage == null
                                ? CircleAvatar(
                                    radius: 60,
                                    backgroundColor:
                                        AppColors.secondaryBackground(
                                            brightness),
                                    child: Icon(
                                      Icons.person,
                                      size: 60,
                                      color: AppColors.primaryText(brightness),
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 60,
                                    backgroundImage: FileImage(selectedImage),
                                  ),
                            Positioned(
                              right: -10,
                              bottom: -10,
                              child: GestureDetector(
                                onTap: () async {
                                  await _registerServices
                                      .pickImage(ImageSource.gallery);
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.primary(brightness),
                                        AppColors.secondary(brightness),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 60),
                  Text(
                    "Nombre",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText(brightness),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16, color: AppColors.primaryText(brightness)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondaryBackground(brightness),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: _registerServices.validateFullName,
                    onSaved: (value) {
                      _registerServices.fullName = value;
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Apellidos",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText(brightness),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16, color: AppColors.primaryText(brightness)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondaryBackground(brightness),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: _registerServices.validateFullName,
                    onSaved: (value) {
                      _registerServices.surname = value;
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Fecha de nacimiento",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText(brightness),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16, color: AppColors.primaryText(brightness)),
                    readOnly: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondaryBackground(brightness),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: AppColors.secondaryText(brightness),
                        ),
                        onPressed: () async {
                          // Handle date picker Services here
                        },
                      ),
                    ),
                    validator: _registerServices.validateDateOfBirth,
                    onSaved: (value) {
                      _registerServices.dateOfBirth = value;
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primary(brightness),
                            AppColors.secondary(brightness),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _registerServices.submit(() =>
                                Navigator.pushNamed(context, AppRoutes.home));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          "Continuar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.tertiaryText(brightness),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
