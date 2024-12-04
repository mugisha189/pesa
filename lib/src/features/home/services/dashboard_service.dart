import 'package:pesa/src/features/transactions/models/transaction.dart';
import 'package:pesa/src/features/home/widgets/card_widget.dart';

class DashboardService {
  List<CardData> getCardData() {
    return [
      CardData(
        currency: 'USD',
        amount: '\$250.00',
        flagImage: 'assets/images/america.png',
      ),
      CardData(
        currency: 'USD',
        amount: '\$290.00',
        flagImage: 'assets/images/america.png',
      ),
      CardData(
        currency: 'USD',
        amount: '\$200.00',
        flagImage: 'assets/images/america.png',
      ),
    ];
  }

  List<Transaction> getTransactions() {
    return [
      Transaction(type: 'deposit', amount: 2000.00, date: DateTime.now().subtract(Duration(days: 1))),
      Transaction(type: 'withdrawal', amount: 500.00, date: DateTime.now().subtract(Duration(days: 2))),
      Transaction(type: 'send', amount: 150.00, date: DateTime.now().subtract(Duration(days: 3))),
      Transaction(type: 'convert', amount: 100.00, date: DateTime.now().subtract(Duration(days: 4))),
    ];
  }
}
