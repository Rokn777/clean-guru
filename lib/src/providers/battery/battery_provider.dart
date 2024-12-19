import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryProvider with ChangeNotifier {
  static const platform = MethodChannel('clean_guru/battery');
  
  int _batteryLevel = 85;
  bool _isCharging = false;
  double _temperature = 32.0;
  String _health = 'Good';
  String _timeRemaining = '3.5 hours';
  bool _isOptimized = false;

  final List<AppBatteryUsage> _appUsage = [
    AppBatteryUsage('YouTube', 25, '2.5 hours'),
    AppBatteryUsage('Chrome', 15, '1.5 hours'),
    AppBatteryUsage('Games', 10, '1 hour'),
    AppBatteryUsage('Others', 50, '5 hours'),
  ];

  int get batteryLevel => _batteryLevel;
  bool get isCharging => _isCharging;
  double get temperature => _temperature;
  String get health => _health;
  String get timeRemaining => _timeRemaining;
  bool get isOptimized => _isOptimized;
  List<AppBatteryUsage> get appUsage => List.unmodifiable(_appUsage);

  BatteryProvider() {
    _initBattery();
    _startBatteryMonitor();
  }

  Future<void> _initBattery() async {
    try {
      final batteryInfo = await platform.invokeMethod('getBatteryInfo');
      _updateBatteryInfo(batteryInfo);
    } on PlatformException catch (e) {
      debugPrint('Failed to get battery info: ${e.message}');
    }
  }

  void _startBatteryMonitor() {
    platform.setMethodCallHandler((call) async {
      if (call.method == 'batteryStateChanged') {
        _updateBatteryInfo(call.arguments);
      }
    });
  }

  void _updateBatteryInfo(Map<dynamic, dynamic> info) {
    _batteryLevel = info['level'] ?? _batteryLevel;
    _isCharging = info['charging'] ?? _isCharging;
    _temperature = info['temperature'] ?? _temperature;
    _health = info['health'] ?? _health;
    _timeRemaining = _calculateTimeRemaining();
    notifyListeners();
  }

  String _calculateTimeRemaining() {
    if (_isCharging) {
      return '${(100 - _batteryLevel) * 2} minutes until full';
    } else {
      return '${_batteryLevel * 4} minutes remaining';
    }
  }

  Future<void> optimizeBattery() async {
    try {
      final result = await platform.invokeMethod('optimizeBattery');
      _isOptimized = result ?? false;
      notifyListeners();
    } on PlatformException catch (e) {
      debugPrint('Failed to optimize battery: ${e.message}');
    }
  }

  Future<void> refreshBatteryStats() async {
    await _initBattery();
  }

  Future<List<AppBatteryUsage>> getAppUsageStats() async {
    try {
      final result = await platform.invokeMethod('getAppUsageStats');
      final List<AppBatteryUsage> stats = (result as List).map((item) {
        return AppBatteryUsage(
          item['appName'],
          item['percentage'],
          item['duration'],
        );
      }).toList();
      return stats;
    } on PlatformException catch (e) {
      debugPrint('Failed to get app usage stats: ${e.message}');
      return _appUsage;
    }
  }
}

class AppBatteryUsage {
  final String appName;
  final int percentage;
  final String duration;

  AppBatteryUsage(this.appName, this.percentage, this.duration);
}