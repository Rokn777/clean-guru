import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme/theme_provider.dart';
import '../../widgets/card_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        CardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: context.watch<ThemeProvider>().isDarkMode,
                onChanged: (value) {
                  context.read<ThemeProvider>().toggleTheme();
                },
              ),
              ListTile(
                title: const Text('Language'),
                trailing: const Text('English'),
                onTap: () {},
              ),
              SwitchListTile(
                title: const Text('Auto Cleanup'),
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        CardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notifications',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Battery Alerts'),
                value: true,
                onChanged: (value) {},
              ),
              SwitchListTile(
                title: const Text('Storage Alerts'),
                value: true,
                onChanged: (value) {},
              ),
              SwitchListTile(
                title: const Text('Performance Alerts'),
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        CardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Version'),
                trailing: const Text('1.0.0'),
              ),
              ListTile(
                title: const Text('Terms of Service'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}