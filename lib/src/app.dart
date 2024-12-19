import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/main/main_screen.dart';
import 'themes/app_theme.dart';

class CleanGuruApp extends StatelessWidget {
  const CleanGuruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Guru',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}