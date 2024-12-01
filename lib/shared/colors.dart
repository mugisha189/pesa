import 'package:flutter/material.dart';

class AppColors {
  static const Color _primaryBackgroundLight = Color(0xFFFFFFFF);
  static const Color _primaryBackgroundDark = Color(0xFF131512);
  static const Color _secondaryBackgroundLight = Color(0xFFF5F5F5);
  static const Color _secondaryBackgroundDark = Color(0xFF2A2C29);
    static const Color _tertiaryBackgroundLight = Color(0xFFF3F3F3);
  static const Color _tertiaryBackgroundDark = Color(0xFFF3F3F3);
  static const Color _cardBackgroundLight = Color(0xFFF5F5F5);
  static const Color _cardBackgroundDark = Color(0xFF2A2A2A);
  static const Color _primaryLight = Color(0xFFA7B5FE);
  static const Color _primaryDark = Color(0xFFA7B5FE);
  static const Color _secondaryLight = Color(0xFF75E1ED);
  static const Color _secondaryDark = Color(0xFF75E1ED);
  static const Color _tertiaryLight = Color(0xFFD9DEF9);
  static const Color _tertiaryDark = Color(0xFFD9DEF9);
  static const Color _quaternaryLight = Color(0xFF99AAFF);
  static const Color _quaternaryDark = Color(0xFF99AAFF);
  static const Color _tertiaryTextLight = Color(0xFF1C274C);
  static const Color _tertiaryTextDark = Color(0xFF1C274C);
  static const Color _primaryTextLight = Colors.black;
  static const Color _primaryTextDark = Colors.white;
  static const Color _secondaryTextLight = Colors.grey;
  static const Color _secondaryTextDark = Colors.grey;

  static const Color accent = Color(0xFF00BFA6);
  static const Color red = Color(0xFFFF5252);
  static const Color green = Color(0xFF4CAF50);

  static Color primaryBackground(Brightness brightness) =>
      brightness != Brightness.dark
          ? _primaryBackgroundDark
          : _primaryBackgroundLight;

  static Color secondaryBackground(Brightness brightness) =>
      brightness != Brightness.dark
          ? _secondaryBackgroundDark
          : _secondaryBackgroundLight;


    static Color tertiaryBackground(Brightness brightness) =>
      brightness != Brightness.dark
          ? _tertiaryBackgroundDark
          : _tertiaryBackgroundLight;

  static Color cardBackground(Brightness brightness) =>
      brightness != Brightness.dark
          ? _cardBackgroundDark
          : _cardBackgroundLight;

  static Color primary(Brightness brightness) =>
      brightness != Brightness.dark ? _primaryDark : _primaryLight;

  static Color secondary(Brightness brightness) =>
      brightness != Brightness.dark ? _secondaryDark : _secondaryLight;

  static Color tertiary(Brightness brightness) =>
      brightness != Brightness.dark ? _tertiaryDark : _tertiaryLight;

  static Color quaternary(Brightness brightness) =>
      brightness != Brightness.dark ? _quaternaryDark : _quaternaryLight;

  static Color tertiaryText(Brightness brightness) =>
      brightness != Brightness.dark ? _tertiaryTextDark : _tertiaryTextLight;

  static Color primaryText(Brightness brightness) =>
      brightness != Brightness.dark ? _primaryTextDark : _primaryTextLight;

  static Color secondaryText(Brightness brightness) =>
      brightness != Brightness.dark ? _secondaryTextDark : _secondaryTextLight;
}
