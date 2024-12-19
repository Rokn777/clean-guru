import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    const ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF2196F3),
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFBBDEFB),
      onPrimaryContainer: Color(0xFF004B87),
      secondary: Color(0xFF4CAF50),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFC8E6C9),
      onSecondaryContainer: Color(0xFF005007),
      tertiary: Color(0xFFFF9800),
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xFFFFE0B2),
      onTertiaryContainer: Color(0xFF492800),
      error: Color(0xFFB00020),
      onError: Colors.white,
      errorContainer: Color(0xFFFDE7E9),
      onErrorContainer: Color(0xFF5F1412),
      surface: Color(0xFFF8F9FA),
      onSurface: Color(0xFF1A1C1E),
      surfaceContainerHighest: Color(0xFFE7E7E7),
      onSurfaceVariant: Color(0xFF44474E),
      outline: Color(0xFF74777F),
      shadow: Colors.black,
      inverseSurface: Color(0xFF2F3033),
      onInverseSurface: Color(0xFFF1F0F4),
      inversePrimary: Color(0xFF90CAF9),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: colorScheme.surface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
      ).apply(fontFamily: 'Roboto'),
    );
  }

  static ThemeData get darkTheme {
    const ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF90CAF9),
      onPrimary: Color(0xFF003258),
      primaryContainer: Color(0xFF004880),
      onPrimaryContainer: Color(0xFFD1E4FF),
      secondary: Color(0xFF81C784),
      onSecondary: Color(0xFF003A03),
      secondaryContainer: Color(0xFF005307),
      onSecondaryContainer: Color(0xFFA7F5A7),
      tertiary: Color(0xFFFFB74D),
      onTertiary: Color(0xFF2F1800),
      tertiaryContainer: Color(0xFF432B00),
      onTertiaryContainer: Color(0xFFFFDDB3),
      error: Color(0xFFCF6679),
      onError: Colors.black,
      errorContainer: Color(0xFF8C0009),
      onErrorContainer: Color(0xFFFFB4AB),
      surface: Color(0xFF1A1C1E),
      onSurface: Color(0xFFE2E2E5),
      surfaceContainerHighest: Color(0xFF44474E),
      onSurfaceVariant: Color(0xFFC4C6CF),
      outline: Color(0xFF8E9099),
      shadow: Colors.black,
      inverseSurface: Color(0xFFE2E2E5),
      onInverseSurface: Color(0xFF1A1C1E),
      inversePrimary: Color(0xFF2196F3),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: colorScheme.surface,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 16),
        bodyMedium: TextStyle(fontSize: 14),
      ).apply(fontFamily: 'Roboto'),
    );
  }
}