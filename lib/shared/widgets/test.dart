import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/app/routes.dart';

class ActionPreviewSuccess extends StatefulWidget {
  final String type;
  final Function act;
  final Function back;
  final Function goToReceipt;

  const ActionPreviewSuccess({
    required this.type,
    required this.act,
    required this.goToReceipt,
    required this.back,
    Key? key,
  }) : super(key: key);

  @override
  _ActionPreviewSuccessState createState() => _ActionPreviewSuccessState();
}

class _ActionPreviewSuccessState extends State<ActionPreviewSuccess> {
  bool isLoading = false;

  void simulateLoading() {
    setState(() {
      isLoading = true;
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => SuccessScreen(
            goToReceipt: widget.goToReceipt,
          ),
        ),
      );
    });
  }

  Widget buildDetails(Brightness brightness) {
    Widget buildSection(String title, Widget listTile, Brightness brightness) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryText(brightness),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.secondaryBackground(
                  brightness), // Adjust the background color
              borderRadius: BorderRadius.circular(12),
            ),
            child: listTile,
          ),
        ],
      );
    }

    switch (widget.type) {
      case 'send':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
                'Desde',
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.9,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBackground(brightness),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cuenta en USD",
                            style: TextStyle(
                              color: AppColors.primaryText(brightness),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "\$2500.00",
                            style: TextStyle(
                              color: AppColors.primaryText(brightness),
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Image.asset(
                        "assets/images/america.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
                brightness),
            const SizedBox(
              height: 20,
            ),
            buildSection(
                'Hacia',
                ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundColor: AppColors.secondaryText(brightness),
                    child: Icon(Icons.person,
                        color: AppColors.primaryBackground(brightness)),
                  ),
                  title: Text(
                    "Abigail Smith",
                    style: TextStyle(color: AppColors.primaryText(brightness)),
                  ),
                  subtitle: Text(
                    "+250  786  564  924",
                    style:
                        TextStyle(color: AppColors.secondaryText(brightness)),
                  ),
                ),
                brightness),
          ],
        );
      case 'withdraw':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
                'Desde',
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width * 0.9,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBackground(brightness),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cuenta en USD",
                            style: TextStyle(
                              color: AppColors.primaryText(brightness),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "\$2500.00",
                            style: TextStyle(
                              color: AppColors.primaryText(brightness),
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Image.asset(
                        "assets/images/america.png",
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
                brightness),
            buildSection(
                'Hacia',
                ListTile(
                  leading: Icon(Icons.account_balance, color: Colors.green),
                  title: Text(
                    'Transferencia bancaria',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('Llegará en: 0-2 días'),
                ),
                brightness),
          ],
        );
      case 'deposit':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
                'Por medio de',
                ListTile(
                  leading: Icon(Icons.credit_card, color: Colors.orange),
                  title: Text(
                    'Tarjeta de crédito',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('Llegará en: Al instante'),
                ),
                brightness),
            buildSection(
                'Hacia',
                ListTile(
                  leading:
                      Icon(Icons.account_balance_wallet, color: Colors.blue),
                  title: Text(
                    'Cuenta en USD',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('\$250.00'),
                ),
                brightness),
          ],
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground(brightness),
        leading: IconButton(
          onPressed: () {
            widget.back();
          },
          icon:
              Icon(Icons.arrow_back, color: AppColors.primaryText(brightness)),
        ),
        title: Text(
          'Detalle de ${widget.type}',
          style: TextStyle(color: AppColors.primaryText(brightness)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.secondaryBackground(brightness),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$500.00',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText(brightness),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Monto',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryText(brightness),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            buildDetails(brightness),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.secondaryBackground(brightness),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Monto de envio",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText(brightness),
                        ),
                      ),
                      Text(
                        "\$500.00",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryText(brightness),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Comisiones",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryText(brightness),
                        ),
                      ),
                      Text(
                        "Gratis",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryText(brightness),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Color(0xFF404040)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recibirás:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryText(brightness),
                        ),
                      ),
                      Text(
                        "\$500.00",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary(brightness),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary(brightness),
                      AppColors.secondary(brightness),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          setState(() {
                            isLoading = true;
                          });
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushNamed(context, AppRoutes.home);
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.tertiaryText(brightness),
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'Confirmar ${widget.type}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.tertiaryText(brightness),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SuccessScreen extends StatelessWidget {
  final Function goToReceipt;

  const SuccessScreen({required this.goToReceipt, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Checkmark icon with gradient
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.purpleAccent],
                ),
              ),
              child: Icon(Icons.check, size: 40, color: Colors.white),
            ),
            SizedBox(height: 24),
            // Title
            Text(
              'Tu envío fue realizado',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            // Subtitle
            Text(
              'Realizaste un envío a tu contacto Abigail Smith desde tu cuenta USD.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            // "Ver recibo" button with gradient
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => goToReceipt(),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ).copyWith(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => Colors.transparent,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.purpleAccent],
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: Text(
                    'Ver recibo',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
