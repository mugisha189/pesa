import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/widgets/gradient_text.dart';
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

  // Fetch filtered transactions based on selectedTab
  List<Transaction> getFilteredTransactions() {
    final transactions = _transactionService.fetchTransactions();
    if (selectedTab == 'all') return transactions;
    if (selectedTab == 'income') {
      return transactions
          .where((t) => t.type == 'deposit' || t.type == 'recieved')
          .toList();
    }
    if (selectedTab == 'expense') {
      return transactions
          .where((t) => t.type != 'deposit' && t.type != 'recieved')
          .toList();
    }
    return [];
  }

  void clearTransactions() {}

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final transactions = getFilteredTransactions();

    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: AppColors.primaryText(brightness)),
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
          // Tabs for filtering
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TabButton(
                label: 'Todos',
                isSelected: selectedTab == 'all',
                onTap: () => setState(() => selectedTab = 'all'),
                brightness: brightness,
              ),
              TabButton(
                label: 'Ingresos',
                isSelected: selectedTab == 'income',
                onTap: () => setState(() => selectedTab = 'income'),
                brightness: brightness,
              ),
              TabButton(
                label: 'Egresos',
                isSelected: selectedTab == 'expense',
                onTap: () => setState(() => selectedTab = 'expense'),
                brightness: brightness,
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
                : Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondaryBackground(brightness),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Historial de movimientos",
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryText(brightness),
                              ),
                            ),
                            GestureDetector(
                              onTap: clearTransactions,
                              child: GradientText(
                                text: "Limpiar",
                                style: TextStyle(
                                  color: AppColors.secondaryText(brightness),
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.tertiary(brightness),
                                    AppColors.quaternary(brightness),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Transaction List
                        Expanded(
                          child: ListView.builder(
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
                  ),
          ),
        ],
      ),
    );
  }
}
