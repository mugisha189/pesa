import 'package:flutter/material.dart';
import 'package:pesa/shared/widgets/choose_payment_method/services/choose_payment_method_service.dart';

class ChoosingAccountAmount extends StatefulWidget {
  final String type;
  final Function(double) onChange;
  final VoidCallback goToNext;

  const ChoosingAccountAmount({
    Key? key,
    required this.type,
    required this.onChange,
    required this.goToNext,
  }) : super(key: key);

  @override
  State<ChoosingAccountAmount> createState() => _ChoosingAccountAmountState();
}

class _ChoosingAccountAmountState extends State<ChoosingAccountAmount> {
  final ChoosePaymentMethodService _service = ChoosePaymentMethodService();
  String amount = '';

  @override
  Widget build(BuildContext context) {
    final lastTransaction = _service.getLastTransaction();

    return Scaffold(
      appBar: AppBar(
        title: Text('Elegir cuenta y monto'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Image.asset('assets/icons/flag_us.png',
                    height: 40, width: 40),
                title: const Text(
                  'USD',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '\$${_service.getAvailableBalance().toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: const Text(
                  'Último retiro',
                  style:  TextStyle(color: Colors.grey, fontSize: 16),
                ),
                subtitle: Text(
                  '${lastTransaction.type} - \$${lastTransaction.amount.toStringAsFixed(2)}',
                  style:  const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      focusNode: FocusNode(),
                      onTap: () => _showCustomKeyboard(context),
                      readOnly: true,
                      controller: TextEditingController(text: '\$$amount'),
                      style: TextStyle(color: Colors.white, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: widget.goToNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  ),
                  child: Text(
                    widget.type,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showCustomKeyboard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey.shade900,
      isScrollControlled: true,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: 12,
                  itemBuilder: (_, index) {
                    String key = index < 9
                        ? '${index + 1}'
                        : index == 9
                            ? ''
                            : index == 10
                                ? '0'
                                : '←';
                    return GestureDetector(
                      onTap: () {
                        if (key == '←') {
                          setState(() {
                            if (amount.isNotEmpty)
                              amount = amount.substring(0, amount.length - 1);
                          });
                        } else if (key.isNotEmpty) {
                          setState(() {
                            amount += key;
                          });
                        }
                        widget.onChange(double.tryParse(amount) ?? 0.0);
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            key,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
