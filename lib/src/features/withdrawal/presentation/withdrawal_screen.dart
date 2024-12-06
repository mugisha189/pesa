import 'package:flutter/material.dart';
import 'package:pesa/shared/widgets/action_preview_success.dart';
import 'package:pesa/shared/widgets/choose_payment_method/presentation/choose_payment_method.dart';
import 'package:pesa/shared/widgets/enter_amount/view/enter_amount.dart';
import 'package:pesa/shared/widgets/reciept.dart';

class WithdrawalScreen extends StatefulWidget {
  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Widget activeComponent;

  @override
  void initState() {
    super.initState();

    activeComponent = EnterAmount(
      type: 'Withdraw',
      back: () => Navigator.pop(context),
      next: (double amount) {
        _switchToChoosingPaymentMethod(amount);
      },
    );

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  void _switchToChoosingPaymentMethod(double amount) {
    _controller.reverse().then((_) {
      setState(() {
        activeComponent = ChoosingPaymentMethod(
          type: 'Withdraw',
          // onChange: (double updatedAmount) {},
          goToNext: () {
            _switchToActionPreview(amount);
          },
        );
      });
      _controller.forward();
    });
  }

  void _switchToActionPreview(double amount) {
    _controller.reverse().then((_) {
      setState(() {
        activeComponent = ActionPreviewSuccess(
          type: 'withdraw',
          act: () {},
          back: () {
            _switchToChoosingPaymentMethod(amount);
          },
          goToReceipt: () {
            _switchToReceipt(amount);
          },
        );
      });
      _controller.forward();
    });
  }

  void _switchToReceipt(double amount) {
    _controller.reverse().then((_) {
      setState(() {
        activeComponent = Receipt();
      });
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SlideTransition(
        position: _slideAnimation,
        child: activeComponent,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
