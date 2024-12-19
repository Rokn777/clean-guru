import 'package:flutter/material.dart';

class ChartConstants {
  static const double defaultChartSize = 180.0;
  static const double sectionSpace = 2.0;
  static const double centerSpace = 40.0;

  static const Map<String, Color> chartColors = {
    'health': Color(0xFF2196F3),    // Blue
    'storage': Color(0xFF4CAF50),    // Green
    'memory': Color(0xFFF44336),     // Red
    'battery': Color(0xFFFF9800),    // Orange
    'performance': Color(0xFF9C27B0), // Purple
  };
}