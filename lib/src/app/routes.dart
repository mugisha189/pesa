import 'package:flutter/material.dart';
import 'package:pesa/src/features/auth/presentation/complete_profile_screen.dart';
import 'package:pesa/src/features/auth/presentation/new_password_screen.dart';
import 'package:pesa/src/features/auth/presentation/reset_screen.dart';
import 'package:pesa/src/features/auth/presentation/verification_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/signup_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/notifications/presentation/notifications_screen.dart';
import '../features/home/presentation/screens/settings_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String completeProfile = '/complete_profile';
  static const String reset = '/reset';
  static const String verification = '/verification';
  static const String newPassword = '/new-password';
  static const String home = '/home';
  static const String notifications = '/notifications';
  static const String settings = '/settings';

  static Route<dynamic> generateRoute(RouteSettings route) {
    switch (route.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case completeProfile:
        return MaterialPageRoute(builder: (_) => CompleteProfileScreen());
      case reset:
        return MaterialPageRoute(builder: (_) => ResetScreen());
      case verification:
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case newPassword:
        return MaterialPageRoute(builder: (_) => NewPasswordScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => NotificationsScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
