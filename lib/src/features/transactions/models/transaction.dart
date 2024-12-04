class Transaction {
  final String type; // deposit, withdrawal, send, convert
  final double amount;
  final DateTime date;

  Transaction({
    required this.type,
    required this.amount,
    required this.date,
  });
} 