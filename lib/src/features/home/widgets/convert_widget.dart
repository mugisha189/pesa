import 'package:flutter/material.dart';
import 'package:pesa/src/features/home/services/convert.dart';

class ConvertWidget extends StatefulWidget {
  const ConvertWidget({Key? key}) : super(key: key);

  @override
  _ConvertWidgetState createState() =>
      _ConvertWidgetState();
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Convertir divisa',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _fromController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Desde',
              suffix: DropdownButton<String>(
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
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _convertedAmount != null
                        ? _convertedAmount!.toStringAsFixed(2)
                        : '0.00',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                DropdownButton<String>(
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
              ],
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: _convertCurrency,
            child: Text('Convertir'),
          ),
        ],
      ),
    );
  }
}
