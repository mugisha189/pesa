import 'package:flutter/material.dart';
import 'package:pesa/src/app/routes.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Configuración',
          style: TextStyle(color: Colors.white),
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
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 40, color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lucas Scott',
                      style: TextStyle(
                        color: Colors.white,
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
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          children: [
                            Icon(Icons.person, color: Colors.white),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Información personal',
                                style: TextStyle(color: Colors.white),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          children: [
                            Icon(Icons.notifications, color: Colors.white),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Notificaciones',
                                style: TextStyle(color: Colors.white),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          children: [
                            Icon(Icons.security, color: Colors.white),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Seguridad',
                                style: TextStyle(color: Colors.white),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            Icon(Icons.language, color: Colors.white),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Lenguaje',
                                style: TextStyle(color: Colors.white),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          children: [
                            Icon(Icons.dark_mode, color: Colors.white),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Modo oscuro',
                                style: TextStyle(color: Colors.white),
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
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.privacy_tip, color: Colors.white),
                      title: Text(
                        'Política de privacidad',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      leading: Icon(Icons.help_center, color: Colors.white),
                      title: Text(
                        'Centro de ayuda',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    ),
                    Divider(color: Colors.grey),
                    ListTile(
                      leading: Icon(Icons.info, color: Colors.white),
                      title: Text(
                        'Sobre PASA app',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
