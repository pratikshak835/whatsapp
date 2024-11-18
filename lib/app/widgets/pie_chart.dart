import 'package:common_jds_flutter/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:outline_pie_chart/outline_pie_chart.dart';
import 'package:whatsapp/app/colors/app_colors.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Define your pie chart data
    final List<PieData> pieData = [
      PieData(percentage: 40, color: Colors.cyan),
      PieData(percentage: 30, color: Colors.red),
      PieData(percentage: 20, color: Colors.yellow),
      PieData(percentage: 10, color: Colors.purple),
    ];

    // Key points corresponding to the pie chart segments
    final List<Map<String, dynamic>> keyPoints = [
      {'label': 'Net Profit', 'percentage': 40, 'color': Colors.cyan},
      {'label': 'Cost', 'percentage': 30, 'color': Colors.red},
      {'label': 'Shipping', 'percentage': 20, 'color': Colors.yellow},
      {'label': 'Tax', 'percentage': 10, 'color': Colors.purple},
    ];

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
      width: MediaQuery.of(context).size.width / 1.15,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: "Sales Breakdown",
              isRilFont: true,
              color: Colors.black,
              fontWeight: CustomFontWeight.bold,
              size: 24,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the contents vertically
              children: [
                PieChartWidget(
                  data: pieData,
                  diameter: 300,
                  enableAnimation: true,
                  animationDuration: const Duration(seconds: 2),
                  strokeWidth: 40,
                  gap: 4,
                  isRTL: false,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Total Sales',
                        isRilFont: true,
                        size: 16,
                        fontWeight: CustomFontWeight.bold,
                        color: AppColors.black,
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: '\u{20B9}',
                            isRilFont: true,
                            size: 24,
                            fontWeight: CustomFontWeight.bold,
                            color: AppColors.black,
                          ),
                          CustomText(
                            text: ' 18,936',
                            isRilFont: true,
                            size: 28,
                            fontWeight: CustomFontWeight.bold,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 200),
                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the legend vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: keyPoints.map((point) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              color: point['color'],
                            ),
                            const SizedBox(width: 8),
                            CustomText(
                              text:
                                  '${point['label']} (${point['percentage']}%)',
                              isRilFont: true,
                              size: 14,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20), // Add space between items
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
