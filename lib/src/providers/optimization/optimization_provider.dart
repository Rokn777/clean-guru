import 'package:flutter/material.dart';
import '../../services/optimization/optimization_service.dart';

class OptimizationProvider with ChangeNotifier {
  final OptimizationService _service;
  bool _isOptimizing = false;
  double _optimizationProgress = 0.0;
  List<OptimizationTask> _tasks = [];

  OptimizationProvider(this._service) {
    _initializeTasks();
  }

  bool get isOptimizing => _isOptimizing;
  double get optimizationProgress => _optimizationProgress;
  List<OptimizationTask> get tasks => _tasks;

  void _initializeTasks() {
    _tasks = [
      OptimizationTask(
        'Cache Cleanup',
        'Clear app cache to free up space',
        'cache',
        false,
      ),
      OptimizationTask(
        'Memory Optimization',
        'Free up RAM for better performance',
        'memory',
        false,
      ),
      OptimizationTask(
        'Battery Optimization',
        'Optimize apps for better battery life',
        'battery',
        false,
      ),
      OptimizationTask(
        'Storage Cleanup',
        'Remove unnecessary files',
        'storage',
        false,
      ),
    ];
    notifyListeners();
  }

  Future<void> startOptimization() async {
    if (_isOptimizing) return;

    _isOptimizing = true;
    _optimizationProgress = 0.0;
    notifyListeners();

    for (var task in _tasks) {
      task.isCompleted = false;
      notifyListeners();

      await _performTask(task);
      _optimizationProgress += 0.25;
      task.isCompleted = true;
      notifyListeners();
    }

    _isOptimizing = false;
    notifyListeners();
  }

  Future<void> _performTask(OptimizationTask task) async {
    switch (task.type) {
      case 'cache':
        await _service.clearCache();
        break;
      case 'memory':
        await _service.optimizeMemory();
        break;
      case 'battery':
        await _service.optimizeBattery();
        break;
      case 'storage':
        await _service.cleanStorage();
        break;
    }
  }

  void resetOptimization() {
    _isOptimizing = false;
    _optimizationProgress = 0.0;
    _initializeTasks();
  }
}

class OptimizationTask {
  final String title;
  final String description;
  final String type;
  bool isCompleted;

  OptimizationTask(
    this.title,
    this.description,
    this.type,
    this.isCompleted,
  );
}