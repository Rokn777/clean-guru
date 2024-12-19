import 'package:flutter/material.dart';

class AppNavigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<T?> pushNamed<T>(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static Future<T?> pushReplacementNamed<T>(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static void pop<T>([T? result]) {
    return navigatorKey.currentState!.pop(result);
  }

  static Future<T?> pushScreen<T>(Widget screen) {
    return navigatorKey.currentState!.push<T>(
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}