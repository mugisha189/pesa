import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/app/routes.dart';
import 'package:pesa/src/features/auth/services/login.dart';

class NewPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LoginServices _loginServices = LoginServices();

  NewPasswordScreen({Key? key}) : super(key: key);

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
                  Text(
                    "Crear nueva contraseña",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ValueListenableBuilder<bool>(
                    valueListenable: _loginServices.isPasswordHidden,
                    builder: (context, isHidden, child) {
                      return TextFormField(
                        style: TextStyle(
                        fontSize: 16, color: AppColors.primaryText(brightness)),
                        obscureText: isHidden,
                        decoration: InputDecoration(
                          labelText: "Confirmar contraseña",
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
                  const SizedBox(height: 20),
                  ValueListenableBuilder<bool>(
                    valueListenable: _loginServices.isPasswordHidden,
                    builder: (context, isHidden, child) {
                      return TextFormField(
                        style: TextStyle(
                        fontSize: 16, color: AppColors.primaryText(brightness)),
                        obscureText: isHidden,
                        decoration: InputDecoration(
                          labelText: "Nueva contraseña",
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
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryText(brightness),
                            AppColors.secondaryText(brightness),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(8),
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Confirmar",
                          style: TextStyle(
                            color: AppColors.primaryText(brightness),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}