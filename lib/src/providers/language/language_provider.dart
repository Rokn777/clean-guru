import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  static const String _key = 'language_code';
  String _currentLanguage = 'en';
  final List<String> _supportedLanguages = ['en', 'ar'];

  String get currentLanguage => _currentLanguage;
  List<String> get supportedLanguages => _supportedLanguages;

  LanguageProvider() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    _currentLanguage = prefs.getString(_key) ?? 'en';
    notifyListeners();
  }

  Future<void> changeLanguage(String? newLanguage) async {
    if (newLanguage == null || !_supportedLanguages.contains(newLanguage)) return;
    
    _currentLanguage = newLanguage;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, newLanguage);
    notifyListeners();
  }
}