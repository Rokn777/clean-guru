import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../widgets/card_container.dart';

class BatteryScreen extends StatelessWidget {
  const BatteryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 8),
        _buildBatteryStatus(context),
        const SizedBox(height: 16),
        _buildBatteryGraph(context),
        const SizedBox(height: 16),
        _buildBatteryUsage(context),
      ],
    );
  }

  Widget _buildBatteryStatus(BuildContext context) {
    return CardContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.battery_charging_full,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '85%',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    '3.5 hours remaining',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Charging - 32°C',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildBatteryGraph(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Battery Usage',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 100),
                      FlSpot(2, 85),
                      FlSpot(4, 70),
                      FlSpot(6, 60),
                      FlSpot(8, 45),
                      FlSpot(10, 30),
                      FlSpot(12, 20),
                    ],
                    isCurved: true,
                    color: Theme.of(context).colorScheme.primary,
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBatteryUsage(BuildContext context) {
    final apps = [
      ('YouTube', Icons.play_circle, '25%'),
      ('Chrome', Icons.chrome_reader_mode, '15%'),
      ('Games', Icons.games, '10%'),
      ('Others', Icons.more_horiz, '50%'),
    ];

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'App Usage',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ...apps.map((app) => ListTile(
                leading: Icon(
                  app.$2,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(app.$1),
                trailing: Text(
                  app.$3,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              )),
        ],
      ),
    );
  }
}