import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:up_todo/src/features/focus/presentation/controller/app_bar_chart_provider.dart';
import 'package:up_todo/src/utils/constants/colors.dart';
import 'package:up_todo/src/utils/formatters/string_formatter.dart';
import 'package:up_todo/src/utils/helpers/calender_helper_functions.dart';

class FocusBarChart extends ConsumerWidget {
  const FocusBarChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBarData = ref.watch(appBarChartProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: appBarData.when(
        error: (error, stackTrace) {
          return const Center(
            child: Text(
              "Unable to fetch app Data",
              textAlign: TextAlign.center,
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) {
          return BarChart(
            BarChartData(
              maxY: data
                      .reduce((a, b) => a.usageTime > b.usageTime ? a : b)
                      .usageTime
                      .ceil() +
                  1,
              minY: 0,
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  left: BorderSide(color: UColors.white),
                  bottom: BorderSide(color: UColors.white),
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: getBottomTitles,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    minIncluded: false,
                    maxIncluded: false,
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: getRightTitles,
                  ),
                ),
              ),
              alignment: BarChartAlignment.center,
              groupsSpace: 20,
              barTouchData: BarTouchData(
                enabled: false,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (group) => Colors.transparent,
                  tooltipPadding: EdgeInsets.zero,
                  tooltipMargin: 4,
                  getTooltipItem: (
                    _,
                    __,
                    BarChartRodData rod,
                    ___,
                  ) {
                    return BarTooltipItem(
                      rod.toY > 0 ? UStringFormatter.formatTime(rod.toY) : '',
                      Theme.of(context).textTheme.labelSmall!,
                    );
                  },
                ),
              ),
              barGroups: data
                  .map(
                    (data) => BarChartGroupData(
                      x: data.dayIndex,
                      showingTooltipIndicators: [0],
                      barRods: [
                        BarChartRodData(
                          toY: data.usageTime,
                          color: UColors.lightGrey,
                          width: 30,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    String dateName = UDatetimeHelperFunction.getNameDay(value.toInt());

    return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(
          dateName,
          style: TextStyle(
              color: dateName == 'SUN' || dateName == 'SAT'
                  ? UColors.error
                  : null),
        ));
  }

  /// Function to reformat the vertical axis value to a more readable form
  ///
  /// Turns "1" to "1h" and returns a [SideTitleWidget]
  Widget getRightTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text('${value.toInt()}h'),
    );
  }
}
