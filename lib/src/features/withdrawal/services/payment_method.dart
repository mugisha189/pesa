import 'package:pesa/shared/utils/payment_method.dart';

class PaymentMethodService {
  List<PaymentMethod> fetchMethods() {
    return [
      PaymentMethod(
        id: 'bank_transfer',
        name: 'Transferencia bancaria',
        timeToArrive: 'Llegaría en: 0-1 días',
        icon: 'assets/icons/flag_us.png',
      ),
      PaymentMethod(
        id: 'credit_card',
        name: 'Tarjeta de crédito',
        timeToArrive: 'Llegaría en: Al instante',
        icon: 'assets/icons/flag_us.png',
      ),
      PaymentMethod(
        id: 'cash_pickup',
        name: 'Entrega de efectivo',
        timeToArrive: 'Llegaría en: Al instante',
        icon: 'assets/icons/flag_us.png',
      ),
      PaymentMethod(
        id: 'crypto',
        name: 'Criptomonedas (para expertos)',
        timeToArrive: 'Llegaría en: Al instante',
        icon: 'assets/icons/flag_us.png',
      ),
    ];
  }
}
