import 'package:common_jds_flutter/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/app/colors/app_colors.dart';
import 'package:whatsapp/app/common/app_bar.dart';
import 'package:whatsapp/app/common/sidebar.dart';
import 'package:whatsapp/app/common/strings.dart';
import 'package:whatsapp/app/widgets/cards_widgets.dart';
import 'package:whatsapp/app/widgets/custom_feedback_analytical_view_widget.dart';
import 'package:whatsapp/app/widgets/custom_success_rate_widget.dart';
import 'package:whatsapp/app/widgets/line_chart.dart';
import 'package:whatsapp/app/widgets/pie_chart.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.FFE0E0E0,
        appBar: const MyAppBar(),
        body: Sidebar(
          widget: Padding(
            padding: const EdgeInsets.only(left: 70.0, right: 10),
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: AppColors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: Strings.dashboard,
                      color: Colors.black,
                      fontWeight: CustomFontWeight.bold,
                      isRilFont: true,
                      size: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardsWidgets(
                            color: Colors.red,
                            icon: Icons.shopping_bag,
                            title: "Number of sales",
                            value: "65",
                          ),
                          CardsWidgets(
                            color: Colors.green,
                            icon: Icons.padding_rounded,
                            title: "Total Orders",
                            value: "15",
                          ),
                          CardsWidgets(
                            color: Colors.blue,
                            icon: Icons.star_half_sharp,
                            title: "Avg Order Value",
                            value: "50",
                          ),
                          CardsWidgets(
                            color: Colors.pink,
                            icon: Icons.percent,
                            title: "Conversion Rate",
                            value: "75%",
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          // BarChartWidget(),
                          // CustomLineChart(
                          //   isShowingMainData: true,
                          // ),
                          CustomPieChart(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
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
                        child: const CustomLineChart(
                          isShowingMainData: true,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: Row(
                        children: [
                          CustomFeedbackAnalyticalViewWidget(),
                          SizedBox(width: 20),
                          CustomSuccessRateWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
