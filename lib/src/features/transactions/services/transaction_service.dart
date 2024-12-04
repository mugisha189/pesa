import 'package:pesa/src/features/transactions/models/transaction.dart';

class TransactionService {
  final List<Transaction> _transactions = [
    Transaction(
        type: 'deposit',
        amount: 2000.00,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        type: 'withdrawal',
        amount: 500.00,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        type: 'send',
        amount: 150.00,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        type: 'convert',
        amount: 100.00,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        type: 'receive',
        amount: 300.00,
        date: DateTime.now().subtract(Duration(days: 5))),
  ];

  List<Transaction> fetchTransactions() {
    return _transactions;
  }

  List<Transaction> fetchTransactionsByType(String type) {
    if (type == 'all') return _transactions;
    if (type == 'income') {
      return _transactions
          .where((t) => t.type == 'deposit' || t.type == 'receive')
          .toList();
    }
    if (type == 'expense') {
      return _transactions
          .where((t) => t.type != 'deposit' && t.type != 'receive')
          .toList();
    }
    return [];
  }
}
