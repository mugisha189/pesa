import 'package:flutter/material.dart';
import 'package:pesa/src/features/withdrawal/services/withdrawal_preview.dart';

class PreviewWithdrawal extends StatelessWidget {
  final WithdrawalPreviewService service;

  const PreviewWithdrawal({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final details = service.getPreviewDetails();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de recarga'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAmountTile(
                'Recargar', '\$${details.rechargeAmount.toStringAsFixed(2)}'),
            const SizedBox(height: 16),
            _buildSectionTitle('Por medio de'),
            _buildInfoTile(
              details.paymentMethod,
              '${details.currency} • ${details.arrivalTime}',
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Hacia'),
            _buildInfoTile(
              'Cuenta en ${details.currency}',
              '\$${details.accountBalance.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 16),
            _buildSummary(details),
            const Spacer(),
            _buildConfirmButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountTile(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 8),
          Text(value,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInfoTile(String title, String subtitle) {
    return ListTile(
      tileColor: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Image.asset('assets/flags/us.png', width: 40, height: 40),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
    );
  }

  Widget _buildSummary(WithdrawalPreviewData details) {
    return Column(
      children: [
        _buildSummaryRow('Monto de recarga',
            '\$${details.rechargeAmount.toStringAsFixed(2)}'),
        const SizedBox(height: 8),
        _buildSummaryRow(
            'Comisiones',
            details.fee == 0
                ? 'Gratis'
                : '\$${details.fee.toStringAsFixed(2)}'),
        const SizedBox(height: 8),
        _buildSummaryRow(
            'Recibirás', '\$${details.totalReceived.toStringAsFixed(2)}'),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        Text(value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Recarga confirmada')),
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.deepPurple,
      ),
      child: const Text(
        'Confirmar recarga',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
