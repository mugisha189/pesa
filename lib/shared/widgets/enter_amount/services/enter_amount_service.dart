import 'package:pesa/src/features/home/widgets/card_widget.dart';

class EnterAmountService {
  static const List<String> suggestionAmounts = [
    '50',
    '100',
    '500',
    '1000',
    '2000'
  ];

  static List<CardData> getAccounts() {
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
}
