import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './routes.dart';
import './providers/theme/theme_provider.dart';
import './providers/language/language_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CleanGuruApp extends StatelessWidget {
  const CleanGuruApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      title: 'Clean Guru',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: themeProvider.themeMode,
      locale: Provider.of<LanguageProvider>(context).locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      initialRoute: Routes.splash,
      routes: Routes.routes,
    );
  }
}