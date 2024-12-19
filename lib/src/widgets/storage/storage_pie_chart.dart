import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StoragePieChart extends StatelessWidget {
  final double used;
  final double total;

  const StoragePieChart({
    super.key,
    required this.used,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: used,
              color: Theme.of(context).colorScheme.primary,
              radius: 50,
              title: '${((used / total) * 100).toStringAsFixed(1)}%',
              titleStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            PieChartSectionData(
              value: total - used,
              color: Theme.of(context).colorScheme.surfaceVariant,
              radius: 45,
            ),
          ],
          centerSpaceRadius: 40,
          sectionsSpace: 2,
        ),
      ),
    );
  }
}