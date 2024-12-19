import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/analytics/analytics_provider.dart';
import '../../widgets/card_container.dart';
import '../../widgets/charts/health_score_chart.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnalyticsProvider>(
      builder: (context, provider, _) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHealthScore(context, provider),
          const SizedBox(height: 16),
          _buildHealthDetails(context, provider),
          const SizedBox(height: 16),
          _buildRecommendations(context, provider),
        ],
      ),
    );
  }

  Widget _buildHealthScore(BuildContext context, AnalyticsProvider provider) {
    final health = provider.deviceHealth;
    if (health == null) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        children: [
          Text(
            'Device Health',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          HealthScoreChart(
            score: health.overall,
            size: 200,
          ),
          const SizedBox(height: 16),
          Text(
            _getHealthStatus(health.overall),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildHealthDetails(BuildContext context, AnalyticsProvider provider) {
    final health = provider.deviceHealth;
    if (health == null) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health Details',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildHealthItem(
            context,
            'Memory',
            health.memory,
            Icons.memory,
          ),
          const SizedBox(height: 12),
          _buildHealthItem(
            context,
            'Storage',
            health.storage,
            Icons.storage,
          ),
          const SizedBox(height: 12),
          _buildHealthItem(
            context,
            'Battery',
            health.battery,
            Icons.battery_full,
          ),
        ],
      ),
    );
  }

  Widget _buildHealthItem(
    BuildContext context,
    String title,
    double value,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: value / 100,
                backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text('${value.toInt()}%'),
      ],
    );
  }

  Widget _buildRecommendations(BuildContext context, AnalyticsProvider provider) {
    final recommendations = provider.getRecommendations();
    if (recommendations.isEmpty) return const SizedBox.shrink();

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommendations',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ...recommendations.map(
            (recommendation) => ListTile(
              leading: const Icon(Icons.lightbulb_outline),
              title: Text(recommendation),
            ),
          ),
        ],
      ),
    );
  }

  String _getHealthStatus(double score) {
    if (score >= 80) return 'Excellent';
    if (score >= 60) return 'Good';
    if (score >= 40) return 'Fair';
    return 'Needs Attention';
  }
}