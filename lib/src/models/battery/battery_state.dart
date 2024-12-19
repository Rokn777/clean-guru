class BatteryState {
  final double level;
  final bool isCharging;
  final double temperature;
  final String health;
  final DateTime timestamp;

  const BatteryState({
    required this.level,
    required this.isCharging,
    required this.temperature,
    required this.health,
    required this.timestamp,
  });

  factory BatteryState.initial() {
    return BatteryState(
      level: 100,
      isCharging: false,
      temperature: 25,
      health: 'Good',
      timestamp: DateTime.now(),
    );
  }
}