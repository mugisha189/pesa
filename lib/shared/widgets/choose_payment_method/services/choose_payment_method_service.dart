

import 'package:pesa/src/features/transactions/models/transaction.dart';

class ChoosePaymentMethodService {
  double getAvailableBalance() {
    return 250.0;
  }

  Transaction getLastTransaction() {
    return Transaction(
        type: 'Retiro de fondos',
        amount: 2000.0,
        date: DateTime.now().subtract(Duration(days: 1)));
  }
}
