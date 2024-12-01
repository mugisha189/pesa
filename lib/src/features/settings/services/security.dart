import 'package:flutter/material.dart';

class SecurityServices {
  bool _rememberMe = true;
  bool _smsAuth = true;
  bool _googleAuth = true;

  bool get rememberMe => _rememberMe;
  bool get smsAuth => _smsAuth;
  bool get googleAuth => _googleAuth;

  void toggleRememberMe() => _rememberMe = !_rememberMe;
  void toggleSmsAuth() => _smsAuth = !_smsAuth;
  void toggleGoogleAuth() => _googleAuth = !_googleAuth;

  void navigateTo(BuildContext context, String route) {
    // Navigator.of(context).pushNamed(route);
  }

  void changePassword(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Change password clicked')),
    );
  }
}
