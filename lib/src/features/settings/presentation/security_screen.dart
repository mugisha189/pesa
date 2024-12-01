import 'package:flutter/material.dart';
import 'package:pesa/src/app/routes.dart';
import 'package:pesa/src/features/settings/services/security.dart';

class SecurityScreen extends StatelessWidget {
  final SecurityServices services = SecurityServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Seguridad', style: TextStyle(color: Colors.white)),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1F1F1F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Recordarme',
                        style: TextStyle(color: Colors.white)),
                    value: services.rememberMe,
                    onChanged: (value) => services.toggleRememberMe(),
                    activeColor: Colors.purple,
                  ),
                  SwitchListTile(
                    title: const Text('SMS Autenticador',
                        style: TextStyle(color: Colors.white)),
                    value: services.smsAuth,
                    onChanged: (value) => services.toggleSmsAuth(),
                    activeColor: Colors.purple,
                  ),
                  SwitchListTile(
                    title: const Text('Google Autenticador',
                        style: TextStyle(color: Colors.white)),
                    value: services.googleAuth,
                    onChanged: (value) => services.toggleGoogleAuth(),
                    activeColor: Colors.purple,
                  ),
                  ListTile(
                    title: const Text('Autenticación Dos-Factores (2FA)',
                        style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                    onTap: () =>
                        services.navigateTo(context, AppRoutes.security),
                  ),
                  ListTile(
                    title: const Text('Manejo de dispositivos',
                        style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white),
                    onTap: () =>
                        services.navigateTo(context, AppRoutes.security),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => services.changePassword(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              child: const Text(
                'Cambiar contraseña',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
