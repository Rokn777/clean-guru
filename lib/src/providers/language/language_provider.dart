import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en', 'US');
  String _currentLanguage = 'en';

  Locale get locale => _locale;
  String get currentLanguage => _currentLanguage;

  void changeLanguage(String languageCode) {
    switch (languageCode) {
      case 'en':
        _locale = const Locale('en', 'US');
        _currentLanguage = 'en';
        break;
      case 'ar':
        _locale = const Locale('ar', 'SA');
        _currentLanguage = 'ar';
        break;
      default:
        _locale = const Locale('en', 'US');
        _currentLanguage = 'en';
    }
    notifyListeners();
  }

  // List of supported languages
  static const List<Map<String, String>> languages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'ar', 'name': 'العربية'},
  ];

  // Get language name by code
  String getLanguageName(String code) {
    final language = languages.firstWhere(
      (lang) => lang['code'] == code,
      orElse: () => {'code': 'en', 'name': 'English'},
    );
    return language['name'] ?? 'English';
  }

  // Check if RTL based on current locale
  bool get isRTL => _locale.languageCode == 'ar';
}