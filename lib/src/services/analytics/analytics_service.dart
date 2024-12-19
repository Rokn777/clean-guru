import 'package:system_info2/system_info2.dart';
import 'package:logger/logger.dart';

class AnalyticsService {
  final Logger _logger = Logger();

  Future<Map<String, dynamic>> getDeviceHealth() async {
    try {
      final memoryHealth = await _getMemoryHealth();
      final storageHealth = await _getStorageHealth();
      final batteryHealth = await _getBatteryHealth();
      
      return {
        'overall': _calculateOverallHealth(
          memoryHealth,
          storageHealth,
          batteryHealth,
        ),
        'memory': memoryHealth,
        'storage': storageHealth,
        'battery': batteryHealth,
      };
    } catch (e) {
      _logger.e('Error in getDeviceHealth: $e');
      return {};
    }
  }

  Future<double> _getMemoryHealth() async {
    try {
      final totalMem = SysInfo.getTotalPhysicalMemory();
      final freeMem = SysInfo.getFreePhysicalMemory();
      return (freeMem / totalMem) * 100;
    } catch (e) {
      _logger.e('Error getting memory health: $e');
      return 0.0;
    }
  }

  Future<double> _getStorageHealth() async {
    try {
      // TODO: Implement actual storage health check
      return 85.0;
    } catch (e) {
      _logger.e('Error getting storage health: $e');
      return 0.0;
    }
  }

  Future<double> _getBatteryHealth() async {
    try {
      // TODO: Implement actual battery health check
      return 90.0;
    } catch (e) {
      _logger.e('Error getting battery health: $e');
      return 0.0;
    }
  }

  double _calculateOverallHealth(
    double memory,
    double storage,
    double battery,
  ) {
    if (memory == 0.0 && storage == 0.0 && battery == 0.0) {
      return 0.0;
    }
    
    var validMetrics = 0;
    var total = 0.0;
    
    if (memory > 0) {
      total += memory;
      validMetrics++;
    }
    if (storage > 0) {
      total += storage;
      validMetrics++;
    }
    if (battery > 0) {
      total += battery;
      validMetrics++;
    }
    
    return validMetrics > 0 ? total / validMetrics : 0.0;
  }
}