import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';

class LearningStatisticsWidget extends GetView<UserService> {
  const LearningStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: 1.sw,
          height: 280.h,
          padding: EdgeInsetsDirectional.all(15.r),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
          ),
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 12,
              minY: 0,
              maxY: 12,
              lineBarsData: [
                LineChartBarData(
                  spots: controller.statisticDashBoard,
                  isCurved: false,
                  color: ColorManager.green5,
                  belowBarData: BarAreaData(
                      show: false,
                      spotsLine: const BarAreaSpotsLine(
                        flLineStyle: FlLine(color: ColorManager.grey),
                        show: true,
                      )),
                  dotData: const FlDotData(
                    show: true,
                  ),
                  preventCurveOverShooting: true,
                ),
              ],
              gridData: const FlGridData(
                  show: false,
                  drawVerticalLine: true,
                  drawHorizontalLine: false),
              // Hide the grid
              titlesData: FlTitlesData(
                show: true,
                topTitles: const AxisTitles(),
                leftTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 20.h,
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  bottom: BorderSide(
                    color: ColorManager.green4,
                    width: 1, // Adjust the width of the bottom border
                  ),
                ),
              ),
              extraLinesData: ExtraLinesData(
                verticalLines: List.generate(
                  13,
                  (index) => VerticalLine(
                    x: double.parse(index.toString()),
                    strokeWidth: 2,
                    color: ColorManager.grey13,
                    dashArray: [5, 5], // Customize the dash pattern if needed
                  ),
                ),
                extraLinesOnTop: false,
              ),
              lineTouchData: const LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: ColorManager.white13,
                  tooltipBorder: BorderSide(
                    color: ColorManager.grey,
                    width: 1,
                  ),
                ),
                handleBuiltInTouches: true,
              ),
            ),
          ),
        ));
  }
}
