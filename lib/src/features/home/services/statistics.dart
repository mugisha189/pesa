import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pesa/shared/colors.dart';

class StatisticsService {
  String selectedPeriod = 'Semanal';
  final List<String> periodOptions = ['Diario', 'Semanal', 'Mensual', 'Anual'];

  void updateSelectedPeriod(String period) {
    selectedPeriod = period;
  }

  List<Map<String, dynamic>> fetchChartData() {
    return [
      {'x': 10, 'y1': 100, 'y2': 200},
      {'x': 11, 'y1': 150, 'y2': 170},
      {'x': 12, 'y1': 80, 'y2': 220},
      {'x': 13, 'y1': 120, 'y2': 250},
      {'x': 14, 'y1': 90, 'y2': 210},
    ];
  }

  Map<String, int> fetchTransactionCounts() {
    return {
      'Recibidos': 32,
      'Retiros': 32,
      'Envíos': 24,
      'Recargas': 24,
    };
  }

Widget buildChartWithLabels(List<Map<String, dynamic>> data,Brightness brightness) {
  return LineChart(
    LineChartData(
      gridData: FlGridData(show: false),
      borderData: FlBorderData(
        show: true,
        border: Border(
          left: BorderSide(color: AppColors.secondaryText(brightness), width: 2),
          bottom: BorderSide(color: AppColors.secondaryText(brightness), width: 2),
        ),
      ),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 44,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: TextStyle(color: AppColors.secondaryText(brightness), fontSize: 12),
              );
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 44,
            getTitlesWidget: (value, meta) {
              return Text(
                value.toInt().toString(),
                style: TextStyle(color: AppColors.secondaryText(brightness), fontSize: 12),
              );
            },
          ),
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: data
              .map((point) =>
                  FlSpot(point['x'].toDouble(), point['y1'].toDouble()))
              .toList(),
          isCurved: true,
          color: Colors.cyan,
          barWidth: 4,
          belowBarData:
              BarAreaData(show: true, color: Colors.cyan.withOpacity(0.3)),
        ),
        LineChartBarData(
          spots: data
              .map((point) =>
                  FlSpot(point['x'].toDouble(), point['y2'].toDouble()))
              .toList(),
          isCurved: true,
          color: Colors.purple,
          barWidth: 4,
          belowBarData:
              BarAreaData(show: true, color: Colors.purple.withOpacity(0.3)),
        ),
      ],
    ),
  );
}

}
