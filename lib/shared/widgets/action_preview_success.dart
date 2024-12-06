import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/images.dart';

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
  bool showSuccessScreen = false;

  void simulateLoading() {
    setState(() {
      isLoading = true;
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        showSuccessScreen = true;
      });
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
                fontSize: 18, color: AppColors.primaryText(brightness)),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.secondaryBackground(brightness),
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
                        Text("Cuenta en USD",
                            style: TextStyle(
                                color: AppColors.primaryText(brightness),
                                fontSize: 16)),
                        const SizedBox(height: 8),
                        Text("\$2500.00",
                            style: TextStyle(
                                color: AppColors.primaryText(brightness),
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Image.asset("assets/images/america.png",
                        width: 40, height: 40),
                  ),
                ],
              ),
              brightness,
            ),
            const SizedBox(height: 20),
            buildSection(
              'Hacia',
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.secondaryText(brightness),
                  child: Icon(Icons.person,
                      color: AppColors.primaryBackground(brightness)),
                ),
                title: Text("Abigail Smith",
                    style: TextStyle(color: AppColors.primaryText(brightness))),
                subtitle: Text("+250  786  564  924",
                    style:
                        TextStyle(color: AppColors.secondaryText(brightness))),
              ),
              brightness,
            ),
          ],
        );
      case 'withdraw':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
              'Hacia',
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
                        Text("Cuenta en USD",
                            style: TextStyle(
                                color: AppColors.primaryText(brightness),
                                fontSize: 16)),
                        const SizedBox(height: 8),
                        Text("\$2500.00",
                            style: TextStyle(
                                color: AppColors.primaryText(brightness),
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Image.asset("assets/images/america.png",
                        width: 40, height: 40),
                  ),
                ],
              ),
              brightness,
            ),
            const SizedBox(height: 20),
            buildSection(
              'Desde',
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBackground(brightness),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Transferencia bancaria",
                              style: TextStyle(
                                color: AppColors.primaryText(brightness),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "USD",
                              style: TextStyle(
                                color: AppColors.primary(brightness),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Procesado en: 1-2 días",
                              style: TextStyle(
                                  color: AppColors.secondaryText(brightness),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Image.asset(AppImages.americanFlag,
                            height: 40, width: 40),
                      ]),
                ),
              ),
              brightness,
            ),
          ],
        );
      case 'deposit':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
              'Por medio de',
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBackground(brightness),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Transferencia bancaria",
                              style: TextStyle(
                                color: AppColors.primaryText(brightness),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "USD",
                              style: TextStyle(
                                color: AppColors.primary(brightness),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Procesado en: 1-2 días",
                              style: TextStyle(
                                  color: AppColors.secondaryText(brightness),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Image.asset(AppImages.americanFlag,
                            height: 40, width: 40),
                      ]),
                ),
              ),
              brightness,
            ),
            const SizedBox(height: 20),
            buildSection(
              'Hacia',
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
                        Text("Cuenta en USD",
                            style: TextStyle(
                                color: AppColors.primaryText(brightness),
                                fontSize: 16)),
                        const SizedBox(height: 8),
                        Text("\$2500.00",
                            style: TextStyle(
                                color: AppColors.primaryText(brightness),
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Image.asset("assets/images/america.png",
                        width: 40, height: 40),
                  ),
                ],
              ),
              brightness,
            ),
          ],
        );

      default:
        return const SizedBox();
    }
  }

  Widget buildSuccessScreen(Brightness brightness) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              AppColors.primary(brightness),
              AppColors.secondary(brightness)
            ]),
          ),
          child: Icon(Icons.check,
              size: 40, color: AppColors.primaryBackground(brightness)),
        ),
        const SizedBox(height: 24),
        Text(
          'Tu envío fue realizado',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText(brightness)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'Realizaste un envío a tu contacto Abigail Smith desde tu cuenta USD.',
          style: TextStyle(
              fontSize: 16, color: AppColors.secondaryText(brightness)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => widget.goToReceipt(),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ).copyWith(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => Colors.transparent),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.primary(brightness),
                  AppColors.secondary(brightness)
                ]),
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: Text('Ver recibo',
                  style: TextStyle(
                      color: AppColors.primaryBackground(brightness),
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    if (showSuccessScreen) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildSuccessScreen(brightness),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground(brightness),
        leading: IconButton(
          onPressed: () => widget.back(),
          icon:
              Icon(Icons.arrow_back, color: AppColors.primaryText(brightness)),
        ),
        title: Text('Detalle de ${widget.type}',
            style: TextStyle(color: AppColors.primaryText(brightness))),
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
                        color: AppColors.primaryText(brightness)),
                  ),
                  const SizedBox(height: 10),
                  Text('Monto',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryText(brightness))),
                ],
              ),
            ),
            const SizedBox(height: 30),
            buildDetails(brightness),
            const SizedBox(height: 30),
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
            const SizedBox(height: 30),
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
                  onPressed: isLoading ? null : simulateLoading,
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
                              color: AppColors.primaryBackground(brightness),
                              strokeWidth: 2),
                        )
                      : Text('Confirmar ${widget.type}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBackground(brightness))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
