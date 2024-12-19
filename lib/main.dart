import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';
import 'src/providers/theme/theme_provider.dart';
import 'src/providers/language/language_provider.dart';
import 'src/providers/battery/battery_provider.dart';
import 'src/providers/storage/storage_provider.dart';
import 'src/providers/ai/ai_provider.dart';
import 'src/utils/permission_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Request required permissions early
  await PermissionUtils.requestPermissions();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set initial system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // Status Bar
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      
      // Navigation Bar
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        // Core Providers
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        
        // Feature Providers
        ChangeNotifierProvider(
          create: (_) => BatteryProvider(),
          lazy: false, // Initialize immediately
        ),
        ChangeNotifierProvider(
          create: (_) => StorageProvider(),
          lazy: false, // Initialize immediately
        ),
        ChangeNotifierProvider(create: (_) => AiProvider()),
      ],
      child: const CleanGuruApp(),
    ),
  );
}