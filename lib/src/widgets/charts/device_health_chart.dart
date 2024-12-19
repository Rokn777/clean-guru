import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DeviceHealthChart extends StatelessWidget {
  final double healthScore;
  final double size;
  final Color? color;

  const DeviceHealthChart({
    super.key,
    required this.healthScore,
    this.size = 180,  // Increased default size
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = color ?? Theme.of(context).colorScheme.primary;
    
    return Column(
      children: [
        SizedBox(
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PieChartSectionData(
                  value: 100 - healthScore,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  radius: (size / 2) - 5,
                  title: '${(100 - healthScore).toInt()}%',
                  titleStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              sectionsSpace: 2,
              centerSpaceRadius: 40,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Storage Usage',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          '32.5 GB free of 128 GB',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}