import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../widgets/card_container.dart';

class MemoryScreen extends StatelessWidget {
  const MemoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 8),
        _buildMemoryStatus(context),
        const SizedBox(height: 16),
        _buildRunningApps(context),
        const SizedBox(height: 16),
        _buildMemoryGraph(context),
      ],
    );
  }

  Widget _buildMemoryStatus(BuildContext context) {
    return CardContainer(
      child: Column(
        children: [
          Text(
            'Memory Usage',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 200,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 65,
                    title: 'Used',
                    color: Theme.of(context).colorScheme.primary,
                    radius: 60,
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  PieChartSectionData(
                    value: 35,
                    title: 'Free',
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    radius: 55,
                  ),
                ],
                centerSpaceRadius: 40,
                sectionsSpace: 2,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '2.1 GB of 6 GB RAM used',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.memory),
            label: const Text('Boost Memory'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 48),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRunningApps(BuildContext context) {
    final apps = [
      ('Chrome', Icons.chrome_reader_mode, '450 MB'),
      ('YouTube', Icons.play_circle, '380 MB'),
      ('Maps', Icons.map, '250 MB'),
      ('Messages', Icons.message, '120 MB'),
    ];

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Running Apps',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ...apps.map((app) => ListTile(
                leading: Icon(
                  app.$2,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(app.$1),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      app.$3,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {},
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildMemoryGraph(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Memory Usage Over Time',
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
                      FlSpot(0, 50),
                      FlSpot(2, 65),
                      FlSpot(4, 45),
                      FlSpot(6, 70),
                      FlSpot(8, 55),
                      FlSpot(10, 35),
                      FlSpot(12, 65),
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
}