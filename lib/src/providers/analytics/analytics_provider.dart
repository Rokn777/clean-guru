import 'package:flutter/material.dart';
import '../../services/analytics/analytics_service.dart';

class AnalyticsProvider with ChangeNotifier {
  final AnalyticsService _service;
  DeviceHealth? _deviceHealth;
  bool _isAnalyzing = false;
  String? _error;

  AnalyticsProvider(this._service) {
    _analyzeDevice();
  }

  bool get isAnalyzing => _isAnalyzing;
  DeviceHealth? get deviceHealth => _deviceHealth;
  String? get error => _error;

  Future<void> _analyzeDevice() async {
    _isAnalyzing = true;
    notifyListeners();

    try {
      final health = await _service.getDeviceHealth();
      _deviceHealth = DeviceHealth.fromMap(health);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isAnalyzing = false;
    notifyListeners();
  }

  Future<void> refreshAnalysis() => _analyzeDevice();

  List<String> getRecommendations() {
    if (_deviceHealth == null) return [];

    final recommendations = <String>[];

    if (_deviceHealth!.memory < 50) {
      recommendations.add('Memory usage is high. Consider closing unused apps.');
    }
    if (_deviceHealth!.storage < 20) {
      recommendations.add('Low storage space. Clean up unnecessary files.');
    }
    if (_deviceHealth!.battery < 30) {
      recommendations.add('Battery health is low. Optimize battery usage.');
    }

    return recommendations;
  }
}

class DeviceHealth {
  final double overall;
  final double memory;
  final double storage;
  final double battery;

  DeviceHealth({
    required this.overall,
    required this.memory,
    required this.storage,
    required this.battery,
  });

  factory DeviceHealth.fromMap(Map<String, dynamic> map) {
    return DeviceHealth(
      overall: map['overall'] ?? 0.0,
      memory: map['memory'] ?? 0.0,
      storage: map['storage'] ?? 0.0,
      battery: map['battery'] ?? 0.0,
    );
  }
}