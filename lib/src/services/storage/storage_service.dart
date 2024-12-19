import 'package:path_provider/path_provider.dart';
import 'package:logger/logger.dart';
import 'dart:io';

class StorageService {
  final Logger _logger = Logger();

  Future<Map<String, dynamic>> getStorageInfo() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final totalSpace = await _getTotalSpace(directory);
      final freeSpace = await _getFreeSpace(directory);
      final usedSpace = totalSpace - freeSpace;

      return {
        'total': totalSpace,
        'free': freeSpace,
        'used': usedSpace,
        'usedPercentage': (usedSpace / totalSpace * 100).toStringAsFixed(1),
      };
    } catch (e) {
      _logger.e('Error getting storage info: $e');
      return {'error': e.toString()};
    }
  }

  Future<int> _getTotalSpace(Directory directory) async {
    try {
      final result = await Process.run('df', [directory.path]);
      final lines = result.stdout.toString().split('\n');
      if (lines.length >= 2) {
        final values = lines[1].split(RegExp(r'\s+'));
        return int.parse(values[1]) * 1024;
      }
      return 0;
    } catch (e) {
      _logger.e('Error getting total space: $e');
      return 0;
    }
  }

  Future<int> _getFreeSpace(Directory directory) async {
    try {
      final result = await Process.run('df', [directory.path]);
      final lines = result.stdout.toString().split('\n');
      if (lines.length >= 2) {
        final values = lines[1].split(RegExp(r'\s+'));
        return int.parse(values[3]) * 1024;
      }
      return 0;
    } catch (e) {
      _logger.e('Error getting free space: $e');
      return 0;
    }
  }
}