import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../constants/chart_constants.dart';

class HealthScoreChart extends StatelessWidget {
  final double score;
  final double size;
  final Duration duration;

  const HealthScoreChart({
    super.key,
    required this.score,
    this.size = ChartConstants.defaultChartSize,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: score),
      duration: duration,
      builder: (context, value, _) => SizedBox(
        height: size,
        width: size,
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                value: value,
                color: _getColorForScore(context, value),
                radius: size / 2,
                title: '${value.toInt()}',
                titleStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                badgeWidget: const Text(
                  'HEALTH\nSCORE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                badgePositionPercentageOffset: 0.98,
              ),
              PieChartSectionData(
                value: 100 - value,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                radius: (size / 2) - 5,
              ),
            ],
            sectionsSpace: ChartConstants.sectionSpace,
            centerSpaceRadius: ChartConstants.centerSpace,
          ),
        ),
      ),
    );
  }

  Color _getColorForScore(BuildContext context, double score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.orange;
    if (score >= 40) return Colors.amber;
    return Colors.red;
  }
}