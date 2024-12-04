import 'package:flutter/material.dart';
import 'package:pesa/src/features/withdrawal/models/withdrawal.dart';
import 'package:pesa/src/features/withdrawal/widgets/choosing_account_amount.dart';
import 'package:pesa/src/features/withdrawal/widgets/choose_method.dart';
import 'package:pesa/src/features/withdrawal/widgets/preview.dart';
import 'package:pesa/src/features/withdrawal/widgets/success.dart';
import 'package:pesa/src/features/withdrawal/widgets/receipt.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({Key? key}) : super(key: key);

  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  Withdrawal withdrawal = Withdrawal(amount: 100.0, method: 'Bank Transfer');
  late Widget currentComponent;

  @override
  void initState() {
    super.initState();
    currentComponent = ChoosingAccountAmount(
      withdrawal: withdrawal,
      onChange: (amount) {
        setState(() {
          withdrawal.amount = amount;
        });
      },
      goToNext: () {
        setState(() {
          currentComponent = ChooseMethod(
            withdrawal: withdrawal,
            onChange: (method) {
              setState(() {
                withdrawal.method = method;
              });
            },
            goToNext: () {
              setState(() {
                currentComponent = Preview(
                  withdrawal: withdrawal,
                  goToNext: () {
                    setState(() {
                      currentComponent = Success(
                        withdrawal: withdrawal,
                        goToNext: () {
                          setState(() {
                            currentComponent = Receipt(
                              withdrawal: withdrawal,
                              goToNext: () {
                                // Navigate to another screen or reset
                              },
                            );
                          });
                        },
                      );
                    });
                  },
                );
              });
            },
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Withdrawal')),
      body: currentComponent,
    );
  }
}
