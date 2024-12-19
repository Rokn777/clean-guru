import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../constants/chart_constants.dart';

class OptimizationProgressChart extends StatelessWidget {
  final double progress;
  final double size;
  final Color? color;

  const OptimizationProgressChart({
    super.key,
    required this.progress,
    this.size = ChartConstants.defaultChartSize,
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
              value: progress * 100,
              color: themeColor,
              radius: size / 2,
              title: '${(progress * 100).toInt()}%',
              titleStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            PieChartSectionData(
              value: (1 - progress) * 100,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              radius: (size / 2) - 5,
            ),
          ],
          sectionsSpace: ChartConstants.sectionSpace,
          centerSpaceRadius: ChartConstants.centerSpace,
        ),
      ),
    );
  }
}