import 'package:flutter/material.dart';
import 'package:pesa/src/features/auth/presentation/complete_profile_screen.dart';
import 'package:pesa/src/features/auth/presentation/new_password_screen.dart';
import 'package:pesa/src/features/auth/presentation/reset_screen.dart';
import 'package:pesa/src/features/auth/presentation/verification_screen.dart';
import 'package:pesa/src/features/settings/presentation/help_screen.dart';
import 'package:pesa/src/features/settings/presentation/languages_screen.dart';
import 'package:pesa/src/features/transactions/screens/transaction_screen.dart';
import 'package:pesa/src/features/withdrawal/presentation/withdrawal_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/signup_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/notifications/presentation/notifications_screen.dart';
import '../features/settings/presentation/settings_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String completeProfile = '/complete_profile';
  static const String reset = '/reset';
  static const String verification = '/verification';
  static const String newPassword = '/new-password';
  static const String home = '/home';
  static const String transactions = '/transactions';
  static const String withdrawal = '/withdrawal';
  static const String notifications = '/notifications';
  static const String settings = '/settings';
  static const String changeLanguages = '/change-language';
  static const String security = '/security';
  static const String help = '/help';

  static Route<dynamic> generateRoute(RouteSettings route) {
    switch (route.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case completeProfile:
        return MaterialPageRoute(builder: (_) => const CompleteProfileScreen());
      case reset:
        return MaterialPageRoute(builder: (_) => ResetScreen());
      case verification:
        return MaterialPageRoute(builder: (_) => VerificationScreen());
      case newPassword:
        return MaterialPageRoute(builder: (_) => NewPasswordScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case transactions:
        return MaterialPageRoute(builder: (_) => TransactionScreen());
      case withdrawal:
        return MaterialPageRoute(builder: (_) => WithdrawalScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => NotificationsScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case changeLanguages:
        return MaterialPageRoute(builder: (_) => LanguagesScreen());
      case security:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case help:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
