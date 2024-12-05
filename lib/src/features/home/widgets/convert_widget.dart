import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/features/home/services/convert.dart';

class ConvertWidget extends StatefulWidget {
  const ConvertWidget({Key? key}) : super(key: key);

  @override
  _ConvertWidgetState createState() => _ConvertWidgetState();
}

class _ConvertWidgetState extends State<ConvertWidget> {
  final TextEditingController _fromController = TextEditingController();
  double? _convertedAmount;
  String _fromCurrency = 'USD';
  String _toCurrency = 'PEN';

  @override
  void dispose() {
    _fromController.dispose();
    super.dispose();
  }

  Future<void> _convertCurrency() async {
    final double fromAmount = double.tryParse(_fromController.text) ?? 0.0;
    if (fromAmount > 0) {
      final double result = await ConvertService.convertCurrency(
          fromAmount, _fromCurrency, _toCurrency);
      setState(() {
        _convertedAmount = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: BoxDecoration(
        color: AppColors.primaryText(brightness),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Convertir divisa',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "Desde",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFF3F3F3)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _fromController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary(brightness),
                        AppColors.secondary(brightness)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: _fromCurrency,
                    items: ['USD', 'PEN', 'EUR']
                        .map((currency) => DropdownMenuItem(
                              value: currency,
                              child: Text(currency),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _fromCurrency = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Hacia',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFF3F3F3)),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _fromController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary(brightness),
                        AppColors.secondary(brightness)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: _toCurrency,
                    items: ['USD', 'PEN', 'EUR']
                        .map((currency) => DropdownMenuItem(
                              value: currency,
                              child: Text(currency),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _toCurrency = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryBackground(brightness),
                borderRadius: BorderRadius.circular(100),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.transparent, 
                  shadowColor: Colors.transparent, 
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Solicitar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText(brightness),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
