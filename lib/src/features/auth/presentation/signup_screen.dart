import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/widgets/gradient_text.dart';
import 'package:pesa/src/app/routes.dart';
import 'package:pesa/src/features/auth/services/signup.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final SignupServices _registerServices = SignupServices();

  SignupScreen({Key? key}) : super(key: key);

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
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Crear cuenta",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText(brightness),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16, color: AppColors.primaryText(brightness)),
                    decoration: InputDecoration(
                      labelText: "Nombre completo",
                      labelStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors.secondaryText(brightness)),
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
                  const SizedBox(height: 20),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16, color: AppColors.primaryText(brightness)),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Número de celular",
                      labelStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors.secondaryText(brightness)),
                      filled: true,
                      fillColor: AppColors.secondaryBackground(brightness),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: _registerServices.validatePhoneNumber,
                    onSaved: (value) {
                      _registerServices.phoneNumber = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder<bool>(
                    valueListenable: _registerServices.isPasswordHidden,
                    builder: (context, isHidden, child) {
                      return TextFormField(
                        style: TextStyle(
                        fontSize: 16, color: AppColors.primaryText(brightness)),
                        obscureText: isHidden,
                        decoration: InputDecoration(
                          labelText: "Contraseña",
                          labelStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors.secondaryText(brightness)),
                          filled: true,
                          fillColor: AppColors.secondaryBackground(brightness),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.secondaryText(brightness),
                            ),
                            onPressed: _registerServices.togglePasswordVisibility,
                          ),
                        ),
                        validator: _registerServices.validatePassword,
                        onSaved: (value) {
                          _registerServices.password = value;
                        },
                      );
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
                                Navigator.pushNamed(context, AppRoutes.completeProfile));
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
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "¿Ya tienes cuenta?",
                          style: TextStyle(
                              color: AppColors.secondaryText(brightness),
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.login);
                          },
                          child: GradientText(
                            text: "Inicia sesión",
                            underline: true,
                            style: TextStyle(
                                color: AppColors.secondaryText(brightness),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            gradient: LinearGradient(
                              colors: [
                                AppColors.tertiary(brightness),
                                AppColors.quaternary(brightness),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                      ],
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
