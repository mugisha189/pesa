import 'package:flutter/material.dart';

class SendService {
  late Widget activeComponent;
  final Function onComponentChange;

  SendService({required this.activeComponent, required this.onComponentChange});

  void setActiveComponent(Widget component) {
    activeComponent = component;
    onComponentChange();
  }
}
