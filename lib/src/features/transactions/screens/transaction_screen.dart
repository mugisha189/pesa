import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/features/transactions/services/transaction_service.dart';
import 'package:pesa/src/features/transactions/models/transaction.dart';
import 'package:pesa/src/features/transactions/widgets/tab_button.dart';
import 'package:pesa/shared/widgets/transaction_card.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final TransactionService _transactionService = TransactionService();
  String selectedTab = 'all';

  List<Transaction> getFilteredTransactions() {
    final transactions = _transactionService.fetchTransactions();
    if (selectedTab == 'all') return transactions;
    if (selectedTab == 'income') {
      return transactions.where((t) => t.type == 'deposit' || t.type == 'receive').toList();
    }
    if (selectedTab == 'expense') {
      return transactions.where((t) => t.type != 'deposit' && t.type != 'receive').toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final transactions = getFilteredTransactions();

    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryText(brightness)),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColors.primaryBackground(brightness),
        centerTitle: true,
        title: Text(
          'Transacciones',
          style: TextStyle(
            color: AppColors.primaryText(brightness),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TabButton(
                label: 'Todos',
                isSelected: selectedTab == 'all',
                onTap: () => setState(() => selectedTab = 'all'),
              ),
              TabButton(
                label: 'Ingresos',
                isSelected: selectedTab == 'income',
                onTap: () => setState(() => selectedTab = 'income'),
              ),
              TabButton(
                label: 'Egresos',
                isSelected: selectedTab == 'expense',
                onTap: () => setState(() => selectedTab = 'expense'),
              ),
            ],
          ),
          Expanded(
            child: transactions.isEmpty
                ? Center(
                    child: Text(
                      'No hay transacciones',
                      style: TextStyle(
                        color: AppColors.primaryText(brightness),
                        fontSize: 16,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      return TransactionCard(
                        transaction: transactions[index],
                        brightness: brightness,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

