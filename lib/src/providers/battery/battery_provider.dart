import 'package:flutter/material.dart';

class BatteryProvider with ChangeNotifier {
  int _batteryLevel = 85;
  bool _isCharging = false;
  String _timeRemaining = '3.5 hours';

  int get batteryLevel => _batteryLevel;
  bool get isCharging => _isCharging;
  String get timeRemaining => _timeRemaining;

  Future<void> updateBatteryStatus() async {
    // TODO: Implement real battery status check
    notifyListeners();
  }

  void setBatteryLevel(int level) {
    _batteryLevel = level;
    notifyListeners();
  }

  void setChargingState(bool charging) {
    _isCharging = charging;
    notifyListeners();
  }

  void setTimeRemaining(String time) {
    _timeRemaining = time;
    notifyListeners();
  }
}