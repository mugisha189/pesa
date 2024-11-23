import 'package:flutter/material.dart';
import 'package:pesa/src/app/routes.dart';
import 'package:pesa/src/features/auth/logic/login.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LoginLogic _loginLogic = LoginLogic();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
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
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    style: theme.textTheme.bodyLarge,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Número de celular",
                      labelStyle: theme.textTheme.bodyMedium,
                      filled: true,
                      fillColor:
                          isDarkMode ? Colors.grey[850] : Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: _loginLogic.validatePhoneNumber,
                    onSaved: (value) {
                      _loginLogic.phoneNumber = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder<bool>(
                    valueListenable: _loginLogic.isPasswordHidden,
                    builder: (context, isHidden, child) {
                      return TextFormField(
                        style: theme.textTheme.bodyLarge,
                        obscureText: isHidden,
                        decoration: InputDecoration(
                          labelText: "Contraseña",
                          labelStyle: theme.textTheme.bodyMedium,
                          filled: true,
                          fillColor:
                              isDarkMode ? Colors.grey[850] : Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: theme.colorScheme.onBackground,
                            ),
                            onPressed: _loginLogic.togglePasswordVisibility,
                          ),
                        ),
                        validator: _loginLogic.validatePassword,
                        onSaved: (value) {
                          _loginLogic.password = value;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // TODO: Implement forgot password navigation
                      },
                      child: Text(
                        "¿Olvidaste tu contraseña?",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.secondary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.primary,
                            theme.colorScheme.secondary,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(
                            8), // Matches button border radius
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _loginLogic.submit(
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
                          "Iniciar sesión",
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onPrimary,
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
                    child: Text(
                      "Registrarse",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.secondary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}