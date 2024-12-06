import 'package:flutter/material.dart';
import 'package:pesa/shared/widgets/action_preview_success.dart';
import 'package:pesa/shared/widgets/enter_amount/view/enter_amount.dart';
import 'package:pesa/shared/widgets/reciept.dart';
import 'package:pesa/src/features/send/widgets/select_contact.dart';

class SendScreen extends StatefulWidget {
  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Widget activeComponent;

  @override
  void initState() {
    super.initState();

    activeComponent = SelectContact(
      onSelectContact: (Map<String, String> contact) {
        _switchToEnterAmount(contact);
      },
    );

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0), // Start from the left (move to the right)
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  void _switchToSelectContact() {
    _controller.reverse().then((_) {
      setState(() {
        activeComponent =
            SelectContact(onSelectContact: (Map<String, String> contact) {
          _switchToEnterAmount(contact);
        });
      });
      _controller.forward();
    });
  }

  void _switchToEnterAmount(Map<String, String> contact) {
    _controller.reverse().then((_) {
      setState(() {
        activeComponent = EnterAmount(
          type: 'Enviar',
          back: () {
            _switchToSelectContact();
          },
          next: (double amount) {
            _switchToActionPreview(contact, amount);
          },
        );
      });
      _controller.forward();
    });
  }

  void _switchToActionPreview(Map<String, String> contact, double amount) {
    _controller.reverse().then((_) {
      setState(() {
        activeComponent = ActionPreviewSuccess(
          type: 'send',
          act: () {},
          back: () {
            _switchToEnterAmount(contact);
          },
          goToReceipt: () {
            _switchToReceipt(contact, amount);
          },
        );
      });
      _controller.forward();
    });
  }

  void _switchToReceipt(Map<String, String> contact, double amount) {
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
