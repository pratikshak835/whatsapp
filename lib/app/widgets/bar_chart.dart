import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/app/colors/app_colors.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Sales data
    final double totalSales = 2798625; // Total sales amount
    final double sunglassesSales = totalSales * 0.20; // 20%
    final double shoesSales = totalSales * 0.60; // 60%
    final double watchesSales = totalSales * 0.20; // 20%

    // Calculate the percentage values for Y-axis (0-100)
    final double sunglassesPercentage = (sunglassesSales / totalSales) * 100;
    final double shoesPercentage = (shoesSales / totalSales) * 100;
    final double watchesPercentage = (watchesSales / totalSales) * 100;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 500,
      width: 585,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: BarChart(BarChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: bottomTitles),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
              ),
            ),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
            ),
          ),
          groupsSpace: 10,
          barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(
                  fromY: 0,
                  toY: sunglassesPercentage,
                  width: 15,
                  color: Colors.amber),
            ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(
                  fromY: 0,
                  toY: shoesPercentage,
                  width: 15,
                  color: Colors.blue),
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(
                  fromY: 0,
                  toY: watchesPercentage,
                  width: 15,
                  color: Colors.green),
            ]),
          ],
        )),
      ),
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Sunglasses';
              break;
            case 1:
              text = 'Shoes';
              break;
            case 2:
              text = 'Watches';
              break;
          }
          return Text(text);
        },
      );
}
