class WithdrawalPreviewData {
  final double rechargeAmount;
  final String paymentMethod;
  final String currency;
  final String arrivalTime;
  final double accountBalance;
  final double fee;
  final double totalReceived;

  WithdrawalPreviewData({
    required this.rechargeAmount,
    required this.paymentMethod,
    required this.currency,
    required this.arrivalTime,
    required this.accountBalance,
    required this.fee,
    required this.totalReceived,
  });
}

class WithdrawalPreviewService {
  WithdrawalPreviewData getPreviewDetails() {
    return WithdrawalPreviewData(
      rechargeAmount: 500.00,
      paymentMethod: "Tarjeta de crédito",
      currency: "USD",
      arrivalTime: "Al instante",
      accountBalance: 250.00,
      fee: 0.00,
      totalReceived: 500.00,
    );
  }
}
