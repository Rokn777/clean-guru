import 'package:flutter/services.dart';

class PlatformUtils {
  static const platform = MethodChannel('clean_guru/platform');

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      final result = await platform.invokeMethod('getDeviceInfo');
      return Map<String, dynamic>.from(result);
    } catch (e) {
      print('Error getting device info: $e');
      return {};
    }
  }

  static Future<Map<String, dynamic>> getStorageInfo() async {
    try {
      final result = await platform.invokeMethod('getStorageInfo');
      return Map<String, dynamic>.from(result);
    } catch (e) {
      print('Error getting storage info: $e');
      return {};
    }
  }

  static Future<Map<String, dynamic>> getMemoryInfo() async {
    try {
      final result = await platform.invokeMethod('getMemoryInfo');
      return Map<String, dynamic>.from(result);
    } catch (e) {
      print('Error getting memory info: $e');
      return {};
    }
  }
}