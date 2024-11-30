import 'package:flutter/material.dart';

class BrightnessProvider extends InheritedWidget {
  final Brightness brightness;

  const BrightnessProvider({
    Key? key,
    required this.brightness,
    required Widget child,
  }) : super(key: key, child: child);

  static BrightnessProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BrightnessProvider>();
  }

  @override
  bool updateShouldNotify(BrightnessProvider oldWidget) {
    return oldWidget.brightness != brightness;
  }
} 