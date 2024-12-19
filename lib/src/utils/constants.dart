class Constants {
  // Storage Constants
  static const int megabyte = 1024 * 1024;
  static const int gigabyte = megabyte * 1024;
  
  // Time Constants
  static const int splashDuration = 2000;
  static const int animationDuration = 300;
  
  // Chart Constants
  static const double defaultChartSize = 200.0;
  static const double chartPadding = 16.0;
  
  // Performance Thresholds
  static const double lowStorageThreshold = 0.1;  // 10%
  static const double lowMemoryThreshold = 0.2;   // 20%
  static const double lowBatteryThreshold = 0.15; // 15%
  
  // File Size Thresholds
  static const int largeFileThreshold = 100 * megabyte; // 100MB
  
  // Permission Messages
  static const String storagePermissionMessage = 'Storage permission is required to analyze and clean your device.';
  static const String usagePermissionMessage = 'Usage access is required to analyze app usage patterns.';
}