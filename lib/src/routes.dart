import 'package:flutter/material.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/battery/battery_screen.dart';
import 'screens/storage/storage_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'constants/app_constants.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.dashboardRoute:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case AppConstants.batteryRoute:
        return MaterialPageRoute(builder: (_) => const BatteryScreen());
      case AppConstants.storageRoute:
        return MaterialPageRoute(builder: (_) => const StorageScreen());
      case AppConstants.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
    }
  }
}