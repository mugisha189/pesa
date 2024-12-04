import 'package:flutter/material.dart';
import 'package:pesa/shared/widgets/payment_method.dart';
import 'package:pesa/src/features/withdrawal/models/withdrawal.dart';
import 'package:pesa/src/features/withdrawal/services/payment_method.dart';

class ChooseMethod extends StatelessWidget {
  final Withdrawal withdrawal;
  final Function(String) onChange;
  final VoidCallback goToNext;

  const ChooseMethod({
    Key? key, 
    required this.withdrawal,
    required this.onChange,
    required this.goToNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final methods = PaymentMethodService().fetchMethods();

    return Scaffold(
      appBar: AppBar(
        title: Text('Elegir método de recarga'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: methods.length,
                itemBuilder: (context, index) {
                  final method = methods[index];
                  return PaymentMethodCard(
                    method: method,
                    isSelected: withdrawal.method == method.id,
                    onSelect: () => onChange(method.id),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: goToNext,
              child: Text('Continuar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
