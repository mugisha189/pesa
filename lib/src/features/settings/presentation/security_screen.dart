import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/app/routes.dart';
import 'package:pesa/src/features/settings/services/security.dart';

class SecurityScreen extends StatelessWidget {
  final SecurityServices services = SecurityServices();

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground(brightness),
        title: Text('Seguridad',
            style: TextStyle(color: AppColors.primaryText(brightness))),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryText(brightness)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBackground(brightness),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: Text('Recordarme',
                            style: TextStyle(
                                color: AppColors.primaryText(brightness))),
                        value: services.rememberMe,
                        onChanged: (value) => services.toggleRememberMe(),
                        activeColor: AppColors.primary(brightness),
                        secondary: Icon(
                          Icons.account_circle,
                          color: AppColors.secondaryText(brightness),
                        ),
                      ),
                      SwitchListTile(
                        title: Text('SMS Autenticador',
                            style: TextStyle(
                                color: AppColors.primaryText(brightness))),
                        value: services.smsAuth,
                        onChanged: (value) => services.toggleSmsAuth(),
                        activeColor: AppColors.primary(brightness),
                        secondary: Icon(
                          Icons.sms,
                          color: AppColors.secondaryText(brightness),
                        ),
                      ),
                      SwitchListTile(
                        title: Text('Google Autenticador',
                            style: TextStyle(
                                color: AppColors.primaryText(brightness))),
                        value: services.googleAuth,
                        onChanged: (value) => services.toggleGoogleAuth(),
                        activeColor: AppColors.primary(brightness),
                        secondary: Icon(
                          Icons.security,
                          color: AppColors.secondaryText(brightness),
                        ),
                      ),
                      ListTile(
                        title: Text('Autenticación Dos-Factores (2FA)',
                            style: TextStyle(
                                color: AppColors.primaryText(brightness))),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: AppColors.primaryText(brightness)),
                        onTap: () =>
                            services.navigateTo(context, AppRoutes.security),
                        leading: Icon(
                          Icons.lock,
                          color: AppColors.secondaryText(brightness),
                        ),
                      ),
                      ListTile(
                        title: Text('Manejo de dispositivos',
                            style: TextStyle(
                                color: AppColors.primaryText(brightness))),
                        trailing: Icon(Icons.arrow_forward_ios,
                            color: AppColors.primaryText(brightness)),
                        onTap: () =>
                            services.navigateTo(context, AppRoutes.security),
                        leading: Icon(
                          Icons.devices,
                          color: AppColors.secondaryText(brightness),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => services.changePassword(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.primaryText(brightness)),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: Text(
                'Cambiar contraseña',
                style: TextStyle(
                    color: AppColors.primaryText(brightness),
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
