import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DeviceHealthChart extends StatelessWidget {
  final double healthScore;
  final double size;
  final Color? color;

  const DeviceHealthChart({
    super.key,
    required this.healthScore,
    this.size = 100,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = color ?? Theme.of(context).colorScheme.primary;
    
    return SizedBox(
      height: size,
      width: size,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: healthScore,
              color: themeColor,
              radius: size / 2,
              title: '${healthScore.toInt()}%',
              titleStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            PieChartSectionData(
              value: 100 - healthScore,
              color: Theme.of(context).colorScheme.surfaceVariant,
              radius: (size / 2) - 5,
            ),
          ],
          sectionsSpace: 2,
          centerSpaceRadius: size / 4,
        ),
      ),
    );
  }
}