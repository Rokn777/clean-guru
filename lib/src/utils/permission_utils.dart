import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class PermissionUtils {
  static Future<bool> checkStoragePermission() async {
    if (await Permission.storage.status.isGranted) {
      return true;
    }
    
    try {
      final result = await Permission.storage.request();
      return result.isGranted;
    } catch (e) {
      debugPrint('Error requesting storage permission: $e');
      return false;
    }
  }

  static Future<bool> checkNotificationPermission() async {
    if (await Permission.notification.status.isGranted) {
      return true;
    }
    
    try {
      final result = await Permission.notification.request();
      return result.isGranted;
    } catch (e) {
      debugPrint('Error requesting notification permission: $e');
      return false;
    }
  }

  static Future<bool> checkUsageStatsPermission() async {
    if (Platform.isAndroid) {
      if (await Permission.appTrackingTransparency.status.isGranted) {
        return true;
      }
      
      try {
        final result = await Permission.appTrackingTransparency.request();
        return result.isGranted;
      } catch (e) {
        debugPrint('Error requesting usage stats permission: $e');
        return false;
      }
    }
    return false; // iOS doesn't support usage stats
  }

  static Future<Map<Permission, PermissionStatus>> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = {};
    
    // Request storage permission
    statuses[Permission.storage] = await Permission.storage.request();
    
    // Request notification permission
    statuses[Permission.notification] = await Permission.notification.request();

    // Request usage stats permission (Android only)
    if (Platform.isAndroid) {
      statuses[Permission.appTrackingTransparency] = 
          await Permission.appTrackingTransparency.request();
    }

    return statuses;
  }

  static Future<bool> hasRequiredPermissions() async {
    final storageStatus = await Permission.storage.status;
    final notificationStatus = await Permission.notification.status;
    
    if (Platform.isAndroid) {
      final usageStatus = await Permission.appTrackingTransparency.status;
      return storageStatus.isGranted && 
             notificationStatus.isGranted && 
             usageStatus.isGranted;
    }
    
    return storageStatus.isGranted && notificationStatus.isGranted;
  }

  static String getPermissionMessage(Permission permission) {
    switch (permission) {
      case Permission.storage:
        return 'Storage permission is required to analyze and clean files';
      case Permission.notification:
        return 'Notification permission is required for alerts';
      case Permission.appTrackingTransparency:
        return 'Usage stats permission is required to analyze app usage';
      default:
        return 'This permission is required for app functionality';
    }
  }

  static Future<void> openSettings() async {
    await openAppSettings();
  }

  static Future<void> showPermissionDialog(
    BuildContext context, 
    Permission permission,
  ) async {
    if (!context.mounted) return;
    
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: Text(getPermissionMessage(permission)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }
}