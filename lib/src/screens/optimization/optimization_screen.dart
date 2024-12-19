import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/optimization/optimization_provider.dart';
import '../../widgets/card_container.dart';
import '../../widgets/charts/optimization_progress_chart.dart';

class OptimizationScreen extends StatelessWidget {
  const OptimizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OptimizationProvider>(
      builder: (context, provider, _) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildOptimizationStatus(context, provider),
          const SizedBox(height: 16),
          _buildTasksList(context, provider),
          if (provider.isOptimizing) ...[
            const SizedBox(height: 16),
            _buildProgress(context, provider),
          ],
        ],
      ),
    );
  }

  Widget _buildOptimizationStatus(BuildContext context, OptimizationProvider provider) {
    return CardContainer(
      child: Column(
        children: [
          Text(
            'Device Optimization',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          OptimizationProgressChart(
            progress: provider.optimizationProgress,
            size: 200,
          ),
          const SizedBox(height: 24),
          Text(
            provider.isOptimizing 
                ? 'Optimizing...' 
                : 'Ready to optimize',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: provider.isOptimizing 
                ? null 
                : () => provider.startOptimization(),
            child: Text(
              provider.isOptimizing ? 'Optimizing...' : 'Start Optimization',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksList(BuildContext context, OptimizationProvider provider) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Optimization Tasks',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ...provider.tasks.map(
            (task) => ListTile(
              leading: Icon(
                task.isCompleted 
                    ? Icons.check_circle 
                    : Icons.radio_button_unchecked,
                color: task.isCompleted
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              title: Text(task.title),
              subtitle: Text(task.description),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgress(BuildContext context, OptimizationProvider provider) {
    return CardContainer(
      child: Column(
        children: [
          LinearProgressIndicator(
            value: provider.optimizationProgress,
          ),
          const SizedBox(height: 8),
          Text(
            '${(provider.optimizationProgress * 100).toInt()}% Complete',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}