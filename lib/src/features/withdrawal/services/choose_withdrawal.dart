import 'package:flutter/material.dart';

class ChooseWithdrawalOption {
  final String title;
  final String currency;
  final String arrivalTime;
  final String flagIcon;

  ChooseWithdrawalOption({
    required this.title,
    required this.currency,
    required this.arrivalTime,
    required this.flagIcon,
  });
}

class ChooseWithdrawalService with ChangeNotifier {
  List<ChooseWithdrawalOption> _options = [];

  List<ChooseWithdrawalOption> get options => _options;

  Future<void> fetchWithdrawalOptions() async {
    await Future.delayed(const Duration(seconds: 1)); 
    _options = [
      ChooseWithdrawalOption(
        title: "Transferencia bancaria",
        currency: "USD",
        arrivalTime: "0-2 días",
        flagIcon: "assets/flags/us.png",
      ),
      ChooseWithdrawalOption(
        title: "Recogida de efectivo",
        currency: "USD",
        arrivalTime: "Al instante",
        flagIcon: "assets/flags/us.png",
      ),
      ChooseWithdrawalOption(
        title: "Criptomonedas (para expertos)",
        currency: "USD",
        arrivalTime: "Al instante",
        flagIcon: "assets/flags/us.png",
      ),
    ];
    notifyListeners();
  }
}
