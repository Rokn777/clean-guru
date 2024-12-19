import 'package:device_info_plus/device_info_plus.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:system_info2/system_info2.dart';
import 'package:app_usage/app_usage.dart';
import 'package:logger/logger.dart';
import 'dart:io';

class DeviceService {
  final Battery _battery = Battery();
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  final Logger _logger = Logger();

  // Battery Info
  Future<Map<String, dynamic>> getBatteryInfo() async {
    try {
      final level = await _battery.batteryLevel;
      final state = await _battery.batteryState;
      
      return {
        'level': level,
        'isCharging': state == BatteryState.charging,
        'temperature': await _getTemperature(),
        'state': state.toString(),
      };
    } catch (e) {
      _logger.e('Error getting battery info: $e');
      return {'error': e.toString()};
    }
  }

  // Storage Info
  Future<Map<String, dynamic>> getStorageInfo() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final stat = await directory.stat();
      final freeSpace = await directory.parent.statSync().size;
      
      return {
        'total': stat.size,
        'free': freeSpace,
        'used': stat.size - freeSpace,
        'usedPercentage': ((stat.size - freeSpace) / stat.size * 100).toStringAsFixed(1),
      };
    } catch (e) {
      _logger.e('Error getting storage info: $e');
      return {'error': e.toString()};
    }
  }

  // Memory Info
  Future<Map<String, dynamic>> getMemoryInfo() async {
    try {
      final totalMemory = SysInfo.getTotalPhysicalMemory();
      final freeMemory = SysInfo.getFreePhysicalMemory();
      final usedMemory = totalMemory - freeMemory;
      
      return {
        'total': totalMemory,
        'free': freeMemory,
        'used': usedMemory,
        'usedPercentage': ((usedMemory / totalMemory) * 100).toStringAsFixed(1),
      };
    } catch (e) {
      _logger.e('Error getting memory info: $e');
      return {'error': e.toString()};
    }
  }

  // App Usage
  Future<List<AppUsageInfo>> getAppUsage() async {
    try {
      final DateTime endDate = DateTime.now();
      final DateTime startDate = endDate.subtract(const Duration(hours: 1));
      
      final List<AppUsageInfo> appUsage = await AppUsage().getAppUsage(startDate, endDate);
      return appUsage;
    } catch (e) {
      _logger.e('Error getting app usage: $e');
      return [];
    }
  }

  // Device Info
  Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return {
          'model': androidInfo.model,
          'brand': androidInfo.brand,
          'androidVersion': androidInfo.version.release,
          'sdk': androidInfo.version.sdkInt,
          'manufacturer': androidInfo.manufacturer,
          'hardware': androidInfo.hardware,
          'isPhysicalDevice': androidInfo.isPhysicalDevice,
        };
      } else {
        final iosInfo = await _deviceInfo.iosInfo;
        return {
          'model': iosInfo.model,
          'systemName': iosInfo.systemName,
          'systemVersion': iosInfo.systemVersion,
          'name': iosInfo.name,
          'isPhysicalDevice': iosInfo.isPhysicalDevice,
          'utsname': iosInfo.utsname.sysname,
        };
      }
    } catch (e) {
      _logger.e('Error getting device info: $e');
      return {'error': e.toString()};
    }
  }

  Future<double> _getTemperature() async {
    try {
      // This is a placeholder. Implement platform-specific code for actual battery temperature
      return 35.0;
    } catch (e) {
      _logger.e('Error getting battery temperature: $e');
      return 0.0;
    }
  }
}