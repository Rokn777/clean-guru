import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DeviceHealthChart extends StatelessWidget {
  final double healthScore;
  final double size;
  final Color? color;

  const DeviceHealthChart({
    super.key,
    required this.healthScore,
    this.size = 120,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = color ?? Theme.of(context).colorScheme.secondary;
    final backgroundColor = Theme.of(context).colorScheme.surfaceVariant;
    
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: healthScore,
                  color: themeColor,
                  radius: size / 3,
                  title: '',
                  showTitle: false,
                ),
                PieChartSectionData(
                  value: 100 - healthScore,
                  color: backgroundColor.withOpacity(0.3),
                  radius: size / 3,
                  title: '',
                  showTitle: false,
                ),
              ],
              sectionsSpace: 0,
              centerSpaceRadius: size / 4,
              startDegreeOffset: -90,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                healthScore.toInt().toString(),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}