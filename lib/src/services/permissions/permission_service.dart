import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<void> initializePermissions() async {
    await _requestStoragePermission();
    await _requestUsageStatsPermission();
  }

  Future<bool> _requestStoragePermission() async {
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  Future<bool> _requestUsageStatsPermission() async {
    final status = await Permission.systemAlertWindow.request();
    return status.isGranted;
  }

  Future<bool> checkStoragePermission() async {
    return await Permission.storage.isGranted;
  }

  Future<bool> checkUsageStatsPermission() async {
    return await Permission.systemAlertWindow.isGranted;
  }
}