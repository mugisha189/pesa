import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/widgets/gradient_text.dart';
import 'package:pesa/src/app/routes.dart';
import 'package:pesa/src/features/auth/services/login.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LoginServices _loginServices = LoginServices();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
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
                      "Iniciar Sesión",
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
                    validator: _loginServices.validatePhoneNumber,
                    onSaved: (value) {
                      _loginServices.phoneNumber = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder<bool>(
                    valueListenable: _loginServices.isPasswordHidden,
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
                            onPressed: _loginServices.togglePasswordVisibility,
                          ),
                        ),
                        validator: _loginServices.validatePassword,
                        onSaved: (value) {
                          _loginServices.password = value;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.reset);
                        },
                        child: GradientText(
                          text: "¿Olvidaste tu contraseña?",
                          style: TextStyle(
                              color: AppColors.secondaryText(brightness),
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          underline: true,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.tertiary(brightness),
                              AppColors.quaternary(brightness),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        )),
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
                            _loginServices.submit(
                              () =>
                                  Navigator.pushNamed(context, AppRoutes.home),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .transparent, // Transparent to allow gradient
                          shadowColor:
                              Colors.transparent, // Removes button shadow
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          "Iniciar sesión",
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
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.signup);
                      },
                      child: GradientText(
                        text: "Registrarse",
                        style: TextStyle(
                            color: AppColors.secondaryText(brightness),
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        underline: true,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.tertiary(brightness),
                            AppColors.quaternary(brightness),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
