import 'package:flutter/material.dart';
import 'package:pesa/src/features/withdrawal/services/choose_withdrawal.dart';

class ChooseWithdrawalMethod extends StatefulWidget {
  const ChooseWithdrawalMethod({Key? key}) : super(key: key);

  @override
  _ChooseWithdrawalMethodState createState() => _ChooseWithdrawalMethodState();
}

class _ChooseWithdrawalMethodState extends State<ChooseWithdrawalMethod> {
  late ChooseWithdrawalService withdrawalService;

  @override
  void initState() {
    super.initState();
    withdrawalService = ChooseWithdrawalService();
    _fetchWithdrawalOptions();
  }

  Future<void> _fetchWithdrawalOptions() async {
    await withdrawalService.fetchWithdrawalOptions();
    setState(() {}); // Rebuild the widget when the options are fetched
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Elegir método de retiro'),
      ),
      body: FutureBuilder(
        future: withdrawalService.fetchWithdrawalOptions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (withdrawalService.options.isEmpty) {
            return const Center(child: Text('No options available.'));
          }

          return ListView.builder(
            itemCount: withdrawalService.options.length,
            itemBuilder: (context, index) {
              final option = withdrawalService.options[index];
              return _WithdrawalOptionTile(option: option);
            },
          );
        },
      ),
    );
  }
}

class _WithdrawalOptionTile extends StatelessWidget {
  final ChooseWithdrawalOption option;

  const _WithdrawalOptionTile({Key? key, required this.option})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(option.flagIcon, width: 40, height: 40),
      title: Text(option.title),
      subtitle: Text(
        '${option.currency} • ${option.arrivalTime}', // e.g., "USD • 0-2 días"
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle option selection
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected: ${option.title}')),
        );
      },
    );
  }
}
