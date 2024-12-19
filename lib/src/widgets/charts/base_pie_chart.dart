import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../constants/chart_constants.dart';

class BasePieChart extends StatelessWidget {
  final double value;
  final String title;
  final String subtitle;
  final Color color;
  final double size;

  const BasePieChart({
    super.key,
    required this.value,
    required this.title,
    required this.subtitle,
    required this.color,
    this.size = ChartConstants.defaultChartSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size,
          width: size,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: value,
                  color: color,
                  radius: size / 2,
                  title: '${value.toInt()}%',
                  titleStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PieChartSectionData(
                  value: 100 - value,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  radius: (size / 2) - 5,
                  title: '${(100 - value).toInt()}%',
                  titleStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              sectionsSpace: ChartConstants.sectionSpace,
              centerSpaceRadius: ChartConstants.centerSpace,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: color,
              ),
        ),
      ],
    );
  }
}