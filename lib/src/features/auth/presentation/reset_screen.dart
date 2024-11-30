import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/app/routes.dart';
import 'package:pesa/src/features/auth/services/reset.dart';

class ResetScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ResetServices _resetServices = ResetServices();

  ResetScreen({Key? key}) : super(key: key);

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
              child: ValueListenableBuilder<TabType>(
                valueListenable: _resetServices.currentTab,
                builder: (context, tab, child) {
                  final isEmailTab = tab == TabType.email;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Recuperar contraseña",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText(brightness),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        isEmailTab
                            ? "Ingrese su email registrado, se le enviará un código de verificación para poder crear una nueva contraseña."
                            : "Ingrese su número de celular registrado, se le enviará un código de verificación para poder crear una nueva contraseña.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryText(brightness),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        key: ValueKey(tab),
                        style: TextStyle(
                        fontSize: 16, color: AppColors.primaryText(brightness)),
                        keyboardType: isEmailTab
                            ? TextInputType.emailAddress
                            : TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: isEmailTab
                              ? "Correo Electrónico"
                              : "Número de Celular",
                          labelStyle: TextStyle(
                              color: AppColors.secondaryText(brightness)),
                          filled: true,
                          fillColor: AppColors.secondaryBackground(brightness),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: isEmailTab
                            ? _resetServices.validateEmail
                            : _resetServices.validatePhoneNumber,
                        onSaved: (value) {
                          if (isEmailTab) {
                            _resetServices.email = value;
                          } else {
                            _resetServices.phoneNumber = value;
                          }
                        },
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primary(brightness),
                                AppColors.secondary(brightness)
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
                                _resetServices.submit(() {
                                  Navigator.pushNamed(
                                      context, AppRoutes.verification);
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Text(
                              "Continuar",
                              style: TextStyle(
                                  color: AppColors.primary(brightness)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: TextButton(
                          onPressed: _resetServices.toggleTab,
                          child: Text(
                            isEmailTab
                                ? "¿Usar número de celular en su lugar?"
                                : "¿Usar correo electrónico en su lugar?",
                            style: TextStyle(
                              color: AppColors.secondaryText(brightness),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
