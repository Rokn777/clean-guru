import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import '../../services/device/device_service.dart';

class DeviceProvider extends ChangeNotifier {
  final DeviceService _deviceService;
  final Logger _logger = Logger();
  
  Map<String, dynamic>? _deviceInfo;
  Map<String, dynamic>? _batteryInfo;
  Map<String, dynamic>? _storageInfo;
  Map<String, dynamic>? _memoryInfo;

  DeviceProvider({required DeviceService deviceService}) : _deviceService = deviceService;

  Map<String, dynamic>? get deviceInfo => _deviceInfo;
  Map<String, dynamic>? get batteryInfo => _batteryInfo;
  Map<String, dynamic>? get storageInfo => _storageInfo;
  Map<String, dynamic>? get memoryInfo => _memoryInfo;

  Future<void> initializeDeviceInfo() async {
    try {
      _deviceInfo = await _deviceService.getDeviceInfo();
      notifyListeners();
    } catch (e) {
      _logger.e('Error initializing device info: $e');
    }
  }

  Future<void> updateBatteryInfo() async {
    try {
      _batteryInfo = await _deviceService.getBatteryInfo();
      notifyListeners();
    } catch (e) {
      _logger.e('Error updating battery info: $e');
    }
  }

  Future<void> updateStorageInfo() async {
    try {
      _storageInfo = await _deviceService.getStorageInfo();
      notifyListeners();
    } catch (e) {
      _logger.e('Error updating storage info: $e');
    }
  }

  Future<void> updateMemoryInfo() async {
    try {
      _memoryInfo = await _deviceService.getMemoryInfo();
      notifyListeners();
    } catch (e) {
      _logger.e('Error updating memory info: $e');
    }
  }

  Future<void> refreshAllInfo() async {
    await Future.wait([
      initializeDeviceInfo(),
      updateBatteryInfo(),
      updateStorageInfo(),
      updateMemoryInfo(),
    ]);
  }
}