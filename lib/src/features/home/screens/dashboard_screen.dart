import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/shared/images.dart';
import 'package:pesa/shared/widgets/gradient_text.dart';
import 'package:pesa/src/app/routes.dart';
import 'package:pesa/src/features/home/services/dashboard_service.dart';
import 'package:pesa/src/features/home/widgets/card_widget.dart';
import 'package:pesa/shared/widgets/transaction_card.dart';
import 'package:dotted_border/dotted_border.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardService _dashboardService = DashboardService();

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final cardDataList = _dashboardService.getCardData();
    final transactions = _dashboardService.getTransactions();

    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hola,',
                          style: TextStyle(
                            color: AppColors.primaryText(brightness),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Francisco Gonzalez',
                          style: TextStyle(
                            color: AppColors.primaryText(brightness),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondaryBackground(brightness),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.settings);
                            },
                            icon: const Icon(Icons.settings),
                            color: AppColors.primaryText(brightness),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.secondaryBackground(brightness),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.notifications);
                              },
                              icon: const Icon(Icons.notifications),
                              color: AppColors.primaryText(brightness),
                            ),
                          ),
                          //   Positioned(
                          //     right: 6,
                          //     top: 6,
                          //     child: Container(
                          //       padding: const EdgeInsets.all(4),
                          //       decoration: const BoxDecoration(
                          //         color: Colors.red,
                          //         shape: BoxShape.circle,
                          //       ),
                          //       child: const Text(
                          //         '!',
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 12,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                        ]),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cardDataList.length +
                        1, // Add one for the "Añadir una divisa" button
                    itemBuilder: (context, index) {
                      if (index < cardDataList.length) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: CardWidget(cardData: cardDataList[index]),
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
                                        color: AppColors.primaryBackground(
                                            brightness),
                                        size: 28,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "Añadir una divisa",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            AppColors.primaryText(brightness),
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
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      AppImages.ads,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
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
                            'Transacciones',
                            style: TextStyle(
                              color: AppColors.primaryText(brightness),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.transactions);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Row(
                              children: [
                                GradientText(
                                  text: "Ver todo",
                                  style: TextStyle(
                                      color:
                                          AppColors.secondaryText(brightness),
                                      decoration: TextDecoration.underline,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.tertiary(brightness),
                                      AppColors.quaternary(brightness),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      AppColors.tertiary(brightness),
                                      AppColors.quaternary(brightness),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds),
                                  child: const Icon(
                                    Icons.chevron_right,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          return TransactionCard(
                            transaction: transactions[index],
                            brightness: brightness,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
