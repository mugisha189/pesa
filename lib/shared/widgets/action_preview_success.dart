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
            goHome: () => Navigator.of(context).pop(),
          ),
        ),
      );
    });
  }

  Widget buildDetails(Brightness brightness) {
    Widget buildSection(String title, Widget listTile,Brightness brightness) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground(
              brightness), // Adjust the background color
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            listTile,
          ],
        ),
      );
    }

    switch (widget.type) {
      case 'send':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
              'Desde',
              ListTile(
                leading: Icon(Icons.account_balance_wallet, color: Colors.blue),
                title: Text(
                  'Cuenta en USD',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('\$2500.00'),
              ),brightness
            ),
            buildSection(
              'Hacia',
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'A',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  'Abigail Smith',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('+250 786 584 924'),
              ),brightness
            ),
          ],
        );
      case 'withdraw':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
              'Desde',
              ListTile(
                leading: Icon(Icons.account_balance_wallet, color: Colors.blue),
                title: Text(
                  'Cuenta en USD',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('\$2500.00'),
              ),
              brightness
            ),
            buildSection(
              'Hacia',
              ListTile(
                leading: Icon(Icons.account_balance, color: Colors.green),
                title: Text(
                  'Transferencia bancaria',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('Llegará en: 0-2 días'),
              ),brightness
            ),
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
              ),brightness
            ),
            buildSection(
              'Hacia',
              ListTile(
                leading: Icon(Icons.account_balance_wallet, color: Colors.blue),
                title: Text(
                  'Cuenta en USD',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('\$250.00'),
              ),brightness
            ),
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
            icon: Icon(Icons.arrow_back,
                color: AppColors.primaryText(brightness))),
        title: Text(
          'Detalle de ${widget.type}',
          style: TextStyle(color: AppColors.primaryText(brightness)),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$500.00',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText(brightness)),
                  ),
                  SizedBox(height: 16),
                  buildDetails(brightness),
                  SizedBox(height: 16),
                  Text(
                    'Monto de ${widget.type}',
                    style: TextStyle(
                        fontSize: 16, color: AppColors.primaryText(brightness)),
                  ),
                  ListTile(
                    title: Text(
                      '\$500.00',
                      style:
                          TextStyle(color: AppColors.primaryText(brightness)),
                    ),
                    subtitle: Text(
                      'Comisiones: Gratis',
                      style:
                          TextStyle(color: AppColors.primaryText(brightness)),
                    ),
                    trailing: Text(
                      'Recibirás: \$500.00',
                      style:
                          TextStyle(color: AppColors.primaryText(brightness)),
                    ),
                  ),
                  Spacer(),
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
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.home);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor:
                              Colors.transparent, // Removes button shadow
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
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
  final Function goHome;

  const SuccessScreen(
      {required this.goToReceipt, required this.goHome, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 80, color: Colors.green),
            SizedBox(height: 16),
            Text(
              '¡Transacción exitosa!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Tu transacción se ha completado correctamente.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => goToReceipt(),
              child: Text('Ir al recibo'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => goHome(),
              child: Text('Ir a Inicio'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
