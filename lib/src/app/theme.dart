import 'package:flutter/material.dart';

// Light theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    background: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black), // Replaces bodyText1
    bodyMedium: TextStyle(color: Colors.black54), // Replaces bodyText2
    headlineLarge:
        TextStyle(color: Colors.black87, fontSize: 24), // Replaces headline1
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
  ),
);

// Dark theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,
  colorScheme: const ColorScheme.dark(
    primary: Colors.blueGrey,
    secondary: Colors.blueAccent,
    background: Colors.black,
  ),
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white), // Replaces bodyText1
    bodyMedium: TextStyle(color: Colors.white70), // Replaces bodyText2
    headlineLarge:
        TextStyle(color: Colors.white, fontSize: 24), // Replaces headline1
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
  ),
);
