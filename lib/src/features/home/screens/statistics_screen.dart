import 'package:flutter/material.dart';
import 'package:pesa/shared/colors.dart';
import 'package:pesa/src/features/home/services/statistics.dart';

class StatisticsScreen extends StatelessWidget {
  final StatisticsService _statisticsService = StatisticsService();

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final data = _statisticsService.fetchChartData();
    final transactionCounts = _statisticsService.fetchTransactionCounts();

    return Scaffold(
      backgroundColor: AppColors.primaryBackground(brightness),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackground(brightness),
        elevation: 0,
        title: Text(
          'Estadísticas',
          style: TextStyle(
            color: AppColors.primaryText(brightness),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Wrap content with SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardBackground(brightness),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ingresos y egresos',
                        style: TextStyle(
                          color: AppColors.primaryText(brightness),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      AppColors.primaryBackground(brightness),
                                  width: 1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: DropdownButton<String>(
                              value: _statisticsService.selectedPeriod,
                              items: _statisticsService.periodOptions
                                  .map(
                                    (period) => DropdownMenuItem<String>(
                                      value: period,
                                      child: Text(
                                        period,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              AppColors.primaryText(brightness),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                _statisticsService.updateSelectedPeriod(value!);
                              },
                              underline: SizedBox(),
                              icon: Icon(Icons.arrow_drop_down,
                                  color: AppColors.primaryText(brightness)),
                            ),
                          ),
                          PopupMenuButton<String>(
                            icon: Icon(Icons.more_vert,
                                color: AppColors.primaryText(brightness)),
                            onSelected: (value) {
                              // Handle menu item selection here
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 'Option 1',
                                child: Text('Option 1'),
                              ),
                              PopupMenuItem(
                                value: 'Option 2',
                                child: Text('Option 2'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 300,
                    child: data.isEmpty
                        ? Center(
                            child: Text(
                              'No data available',
                              style: TextStyle(
                                  color: AppColors.secondaryText(brightness)),
                            ),
                          )
                        : _statisticsService.buildChartWithLabels(
                            data, brightness),
                  ),
                  Center(
                    child: Text(
                      'Balance: 2 000 USD',
                      style: TextStyle(
                        color: AppColors.primaryText(brightness),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardBackground(brightness),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Número de transacciones',
                    style: TextStyle(
                      color: AppColors.primaryText(brightness),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: AppColors.primaryBackground(brightness),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: transactionCounts.entries.map((entry) {
                      return Column(
                        children: [
                          Text(
                            '${entry.value}',
                            style: TextStyle(
                              color: AppColors.primaryText(brightness),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            entry.key,
                            style: TextStyle(
                              color: AppColors.secondaryText(brightness),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
