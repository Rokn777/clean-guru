import 'package:flutter/material.dart';
import '../../widgets/card_container.dart';
import '../../widgets/animated_progress_bar.dart';

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 8),
        _buildPerformanceScore(context),
        const SizedBox(height: 16),
        _buildPerformanceMetrics(context),
        const SizedBox(height: 16),
        _buildOptimizations(context),
      ],
    );
  }

  Widget _buildPerformanceScore(BuildContext context) {
    return CardContainer(
      child: Column(
        children: [
          Text(
            'Performance Score',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 12,
                  backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Text(
                '75',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Good Performance',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.speed),
            label: const Text('Optimize Now'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 48),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceMetrics(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'System Metrics',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildMetricItem(
            context,
            'CPU Usage',
            0.45,
            '45%',
            Icons.memory,
          ),
          const SizedBox(height: 16),
          _buildMetricItem(
            context,
            'GPU Usage',
            0.30,
            '30%',
            Icons.gradient,
          ),
          const SizedBox(height: 16),
          _buildMetricItem(
            context,
            'Disk I/O',
            0.65,
            '65%',
            Icons.storage,
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(
    BuildContext context,
    String title,
    double value,
    String label,
    IconData icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Text(title),
            const Spacer(),
            Text(label),
          ],
        ),
        const SizedBox(height: 8),
        AnimatedProgressBar(value: value),
      ],
    );
  }

  Widget _buildOptimizations(BuildContext context) {
    final optimizations = [
      ('High CPU Usage Apps', Icons.warning, Colors.orange),
      ('Background Services', Icons.running_with_errors, Colors.red),
      ('Startup Apps', Icons.power_settings_new, Colors.green),
      ('System Services', Icons.miscellaneous_services, Colors.blue),
    ];

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Optimizations',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ...optimizations.map((opt) => ListTile(
                leading: Icon(opt.$2, color: opt.$3),
                title: Text(opt.$1),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              )),
        ],
      ),
    );
  }
}