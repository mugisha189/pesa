import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/app/routes.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brightness  = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground(brightness),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryText(brightness)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Configuración',
          style: TextStyle(color: AppColors.primaryText(brightness)),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.primaryText(brightness),
                      child: Icon(Icons.person, size: 40, color: AppColors.primaryBackground(brightness)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lucas Scott',
                      style: TextStyle(
                        color: AppColors.primaryText(brightness),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '@lucasscott3',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "General",
                      style: TextStyle(
                          color: AppColors.primaryText(brightness),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50, // Set a fixed height for consistent spacing
                        child: Row(
                          children: [
                            Icon(Icons.person, color: AppColors.primaryText(brightness)),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Información personal',
                                style: TextStyle(color: AppColors.primaryText(brightness)),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.security);
                      },
                      child: Container(
                        height: 50, // Set a fixed height for consistent spacing
                        child: Row(
                          children: [
                            Icon(Icons.notifications, color: AppColors.primaryText(brightness)),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Notificaciones',
                                style: TextStyle(color: AppColors.primaryText(brightness)),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.security);
                      },
                      child: Container(
                        height: 50, // Set a fixed height for consistent spacing
                        child: Row(
                          children: [
                            Icon(Icons.security, color: AppColors.primaryText(brightness)),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Seguridad',
                                style: TextStyle(color: AppColors.primaryText(brightness)),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.changeLanguages);
                      },
                      child: Container(
                        height: 50, // Set a fixed height for consistent spacing
                        child: Row(
                          children: [
                            Icon(Icons.language, color: AppColors.primaryText(brightness)),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Lenguaje',
                                style: TextStyle(color: AppColors.primaryText(brightness)),
                              ),
                            ),
                            Text(
                              'Español (PE)',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50, // Set a fixed height for consistent spacing
                        child: Row(
                          children: [
                            Icon(Icons.dark_mode, color: AppColors.primaryText(brightness)),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Modo oscuro',
                                style: TextStyle(color: AppColors.primaryText(brightness)),
                              ),
                            ),
                            Switch(
                              value: true,
                              onChanged: (value) {},
                              activeColor: Colors.purple,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Acerca de",
                        style: TextStyle(
                          color: AppColors.primaryText(brightness),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50, // Set a fixed height for consistent spacing
                        child: Row(
                          children: [
                            Icon(Icons.privacy_tip, color: AppColors.primaryText(brightness)),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Política de privacidad',
                                style: TextStyle(color: AppColors.primaryText(brightness)),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.help);
                      },
                      child: Container(
                        height: 50, // Set a fixed height for consistent spacing
                        child: Row(
                          children: [
                            Icon(Icons.help_center, color: AppColors.primaryText(brightness)),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Centro de ayuda',
                                style: TextStyle(color: AppColors.primaryText(brightness)),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 50, // Set a fixed height for consistent spacing
                        child: Row(
                          children: [
                            Icon(Icons.info, color: AppColors.primaryText(brightness)),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Sobre PASA app',
                                style: TextStyle(color: AppColors.primaryText(brightness)),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Handle sign-out action
                      },
                      child: Container(
                        height: 50, // Set a fixed height for consistent spacing
                        child: Center(
                          child: Text(
                            'Cerrar sesión',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
