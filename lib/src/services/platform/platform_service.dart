import 'package:logger/logger.dart';
import 'package:flutter/services.dart';

class PlatformService {
  static const _platform = MethodChannel('com.cleanguru/platform');
  final _logger = Logger();

  Future<bool> isRooted() async {
    try {
      final bool isRooted = await _platform.invokeMethod('isRooted');
      return isRooted;
    } catch (e) {
      _logger.e('Error checking root status: $e');
      return false;
    }
  }

  Future<bool> hasUsagePermission() async {
    try {
      final bool hasPermission = await _platform.invokeMethod('hasUsagePermission');
      return hasPermission;
    } catch (e) {
      _logger.e('Error checking usage permission: $e');
      return false;
    }
  }

  Future<void> openUsageSettings() async {
    try {
      await _platform.invokeMethod('openUsageSettings');
    } catch (e) {
      _logger.e('Error opening usage settings: $e');
    }
  }
}