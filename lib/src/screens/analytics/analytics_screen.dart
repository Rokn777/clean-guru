import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/analytics/analytics_provider.dart';
import '../../widgets/card_container.dart';
import '../../widgets/charts/device_health_chart.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnalyticsProvider>(
      builder: (context, provider, _) {
        if (provider.isAnalyzing) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (provider.error != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(provider.error!),
                ElevatedButton(
                  onPressed: provider.refreshAnalysis,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: provider.refreshAnalysis,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildOverallHealth(context, provider),
              const SizedBox(height: 16),
              _buildPerformanceMetrics(context, provider),
              const SizedBox(height: 16),
              _buildOptimizationSuggestions(context, provider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOverallHealth(BuildContext context, AnalyticsProvider provider) {
    final health = provider.deviceHealth;
    if (health == null) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        children: [
          Text(
            'Overall Device Health',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          DeviceHealthChart(
            healthScore: health.overall,
            size: 200,
          ),
          const SizedBox(height: 16),
          Text(
            _getHealthStatusDescription(health.overall),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceMetrics(BuildContext context, AnalyticsProvider provider) {
    final health = provider.deviceHealth;
    if (health == null) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Metrics',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildMetricItem(
            context,
            'Memory Usage',
            health.memory,
            Icons.memory,
          ),
          const SizedBox(height: 12),
          _buildMetricItem(
            context,
            'Storage Usage',
            health.storage,
            Icons.storage,
          ),
          const SizedBox(height: 12),
          _buildMetricItem(
            context,
            'Battery Health',
            health.battery,
            Icons.battery_full,
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(
    BuildContext context,
    String title,
    double value,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: value / 100,
                backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text('${value.toInt()}%'),
      ],
    );
  }

  Widget _buildOptimizationSuggestions(
    BuildContext context,
    AnalyticsProvider provider,
  ) {
    final recommendations = provider.getRecommendations();
    if (recommendations.isEmpty) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Optimization Suggestions',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ...recommendations.map((recommendation) => ListTile(
            leading: const Icon(Icons.lightbulb_outline),
            title: Text(recommendation),
          )),
        ],
      ),
    );
  }

  String _getHealthStatusDescription(double score) {
    if (score >= 80) return 'Your device is in excellent condition';
    if (score >= 60) return 'Your device is performing well';
    if (score >= 40) return 'Your device needs some optimization';
    return 'Your device requires immediate attention';
  }
}