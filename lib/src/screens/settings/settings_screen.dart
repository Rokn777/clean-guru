import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme/theme_provider.dart';
import '../../providers/language/language_provider.dart';
import '../../widgets/card_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('General'),
                Consumer<ThemeProvider>(
                  builder: (context, theme, _) => SwitchListTile(
                    title: const Text('Dark Mode'),
                    value: theme.isDarkMode,
                    onChanged: (_) => theme.toggleTheme(),
                  ),
                ),
                Consumer<LanguageProvider>(
                  builder: (context, language, _) => ListTile(
                    title: const Text('Language'),
                    trailing: DropdownButton<String>(
                      value: language.currentLanguage,
                      items: LanguageProvider.languages
                          .map((lang) => DropdownMenuItem(
                                value: lang['code'],
                                child: Text(lang['name']!),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          language.changeLanguage(value);
                        }
                      },
                    ),
                  ),
                ),
                SwitchListTile(
                  title: const Text('Auto Cleanup'),
                  value: true,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          // ... rest of the settings UI
        ],
      ),
    );
  }
}