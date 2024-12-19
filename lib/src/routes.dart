import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/main/main_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/storage/storage_screen.dart';
import 'screens/memory/memory_screen.dart';
import 'screens/battery/battery_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/analytics/analytics_screen.dart';
import 'screens/optimization/optimization_screen.dart';

class Routes {
  static const String splash = '/';
  static const String main = '/main';
  static const String dashboard = '/dashboard';
  static const String storage = '/storage';
  static const String memory = '/memory';
  static const String battery = '/battery';
  static const String settings = '/settings';
  static const String analytics = '/analytics';
  static const String optimization = '/optimization';

  static Map<String, Widget Function(BuildContext)> get routes => {
    splash: (context) => const SplashScreen(),
    main: (context) => const MainScreen(),
    dashboard: (context) => const DashboardScreen(),
    storage: (context) => const StorageScreen(),
    memory: (context) => const MemoryScreen(),
    battery: (context) => const BatteryScreen(),
    settings: (context) => const SettingsScreen(),
    analytics: (context) => const AnalyticsScreen(),
    optimization: (context) => const OptimizationScreen(),
  };

  // Prevent instantiation
  Routes._();
}