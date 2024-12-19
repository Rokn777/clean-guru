import 'package:flutter/material.dart';

class StorageProvider with ChangeNotifier {
  double _totalStorage = 128.0; // GB
  double _usedStorage = 95.5; // GB

  List<StorageItem> _storageItems = [
    StorageItem('Apps', 45.2, Icons.apps),
    StorageItem('Media', 28.4, Icons.photo_library),
    StorageItem('Documents', 12.8, Icons.description),
    StorageItem('Others', 9.1, Icons.more_horiz),
  ];

  double get totalStorage => _totalStorage;
  double get usedStorage => _usedStorage;
  double get freeStorage => _totalStorage - _usedStorage;
  List<StorageItem> get storageItems => _storageItems;

  Future<void> analyzeStorage() async {
    // TODO: Implement real storage analysis
    notifyListeners();
  }

  void updateStorageInfo({
    required double total,
    required double used,
    List<StorageItem>? items,
  }) {
    _totalStorage = total;
    _usedStorage = used;
    if (items != null) {
      _storageItems = items;
    }
    notifyListeners();
  }
}

class StorageItem {
  final String name;
  final double size;
  final IconData icon;

  StorageItem(this.name, this.size, this.icon);
}