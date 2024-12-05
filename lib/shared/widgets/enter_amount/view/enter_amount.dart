import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/widgets/enter_amount/services/enter_amount_service.dart';
import 'package:pesa/src/features/home/widgets/card_widget.dart';

class EnterAmount extends StatefulWidget {
  final String type;
  final Function(double amount) next;
  final Function() back;

  const EnterAmount(
      {Key? key, required this.type, required this.next, required this.back})
      : super(key: key);

  @override
  _EnterAmountState createState() => _EnterAmountState();
}

class _EnterAmountState extends State<EnterAmount> {
  double enteredAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    final cardDataList = EnterAmountService.getAccounts();
    final suggestions = EnterAmountService.suggestionAmounts;
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground(brightness),
        elevation: 0,
        title: Text(
          'Elegir cuenta y monto',
          style: TextStyle(color: AppColors.primaryText(brightness)),
        ),
        leading: IconButton(
            onPressed: () {
              widget.back();
            },
            icon: Icon(Icons.arrow_back,
                color: AppColors.primaryText(brightness))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardDataList.length +
                    1, // Add one for the "Añadir una divisa" button
                itemBuilder: (context, index) {
                  if (index < cardDataList.length) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: CardWidget(
                          cardData: cardDataList[index], showButtons: false),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          print("Añadir una divisa tapped!");
                        },
                        child: DottedBorder(
                          color: const Color(0xFF878787),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(16),
                          padding: const EdgeInsets.all(20.0),
                          strokeWidth: 2,
                          child: SizedBox(
                            width: 400,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  backgroundColor: const Color(0xFFD9D9D9),
                                  child: Icon(
                                    Icons.add,
                                    color:
                                        AppColors.primaryBackground(brightness),
                                    size: 28,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "Añadir una divisa",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.primaryText(brightness),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              decoration: BoxDecoration(
                color: AppColors.secondaryBackground(brightness),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enviar a contacto:',
                    style: TextStyle(
                        color: AppColors.primaryText(brightness), fontSize: 16),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person,
                            color: AppColors.primaryBackground(brightness)),
                        radius: 24,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Abigail Smith',
                              style: TextStyle(
                                  color: AppColors.primaryText(brightness),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '+250  786  564  924',
                              style: TextStyle(
                                  color: AppColors.secondaryText(brightness),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: AppColors.primary(brightness)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "\$",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText(brightness)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText(brightness),
                    ),
                    onChanged: (value) {
                      setState(() {
                        enteredAmount = double.parse(value);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Container(
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 30),
                    ),
                    onPressed: () => widget.next(enteredAmount),
                    child: Center(
                      child: Text(
                        'Siguiente',
                        style: TextStyle(
                            color: AppColors.primaryBackground(brightness),
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
