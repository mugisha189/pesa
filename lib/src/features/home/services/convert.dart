class ConvertService {
  static const Map<String, double> _exchangeRates = {
    'USD_PEN': 3.754,
    'PEN_USD': 0.2664,
    'USD_EUR': 0.92,
    'EUR_USD': 1.09,
    'PEN_EUR': 0.245,
    'EUR_PEN': 4.08,
  };

  static Future<double> convertCurrency(
      double amount, String fromCurrency, String toCurrency) async {
    final String conversionKey = '${fromCurrency}_${toCurrency}';
    final double? rate = _exchangeRates[conversionKey];

    if (rate == null) {
      throw Exception('Exchange rate not found for $conversionKey');
    }

    return amount * rate;
  }
}
