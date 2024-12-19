import 'package:flutter/material.dart';
import '../dashboard/dashboard_screen.dart';
import '../storage/storage_screen.dart';
import '../memory/memory_screen.dart';
import '../battery/battery_screen.dart';
import '../performance/performance_screen.dart';
import '../settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<(Widget, String)> _screens = [
    (const DashboardScreen(), 'Clean Guru'),
    (const StorageScreen(), 'Storage'),
    (const MemoryScreen(), 'Memory'),
    (const BatteryScreen(), 'Battery'),
    (const PerformanceScreen(), 'Performance'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_currentIndex].$2),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: const Text('Settings'),
                    ),
                    body: const SettingsScreen(),
                    bottomNavigationBar: NavigationBar(
                      selectedIndex: _currentIndex,
                      onDestinationSelected: (index) {
                        Navigator.pop(context);
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      destinations: const [
                        NavigationDestination(
                          icon: Icon(Icons.dashboard_outlined),
                          selectedIcon: Icon(Icons.dashboard),
                          label: 'Dashboard',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.storage_outlined),
                          selectedIcon: Icon(Icons.storage),
                          label: 'Storage',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.memory_outlined),
                          selectedIcon: Icon(Icons.memory),
                          label: 'Memory',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.battery_charging_full_outlined),
                          selectedIcon: Icon(Icons.battery_charging_full),
                          label: 'Battery',
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.speed_outlined),
                          selectedIcon: Icon(Icons.speed),
                          label: 'Performance',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens.map((screen) => screen.$1).toList(),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.storage_outlined),
            selectedIcon: Icon(Icons.storage),
            label: 'Storage',
          ),
          NavigationDestination(
            icon: Icon(Icons.memory_outlined),
            selectedIcon: Icon(Icons.memory),
            label: 'Memory',
          ),
          NavigationDestination(
            icon: Icon(Icons.battery_charging_full_outlined),
            selectedIcon: Icon(Icons.battery_charging_full),
            label: 'Battery',
          ),
          NavigationDestination(
            icon: Icon(Icons.speed_outlined),
            selectedIcon: Icon(Icons.speed),
            label: 'Performance',
          ),
        ],
      ),
    );
  }
}