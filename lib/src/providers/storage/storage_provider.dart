import 'package:flutter/material.dart';

class StorageProvider with ChangeNotifier {
  double _totalStorage = 128.0;  // GB
  double _usedStorage = 95.5;    // GB

  List<StorageItem> _items = [
    StorageItem('Apps', 45.2, 'app'),
    StorageItem('Images', 28.4, 'image'),
    StorageItem('Videos', 12.8, 'video'),
    StorageItem('Documents', 9.1, 'document'),
  ];

  List<StorageFile> _largeFiles = [
    StorageFile('Video.mp4', 1.2, 'video'),
    StorageFile('Document.pdf', 0.856, 'document'),
    StorageFile('Image.jpg', 0.425, 'image'),
  ];

  double get totalStorage => _totalStorage;
  double get usedStorage => _usedStorage;
  double get freeStorage => _totalStorage - _usedStorage;
  List<StorageItem> get items => _items;
  List<StorageFile> get largeFiles => _largeFiles;

  Future<void> analyzeStorage() async {
    // TODO: Implement real storage analysis
    notifyListeners();
  }

  Future<void> cleanStorage() async {
    // TODO: Implement real storage cleaning
    _usedStorage *= 0.9;
    notifyListeners();
  }
}

class StorageItem {
  final String name;
  final double size;
  final String type;

  StorageItem(this.name, this.size, this.type);
}

class StorageFile {
  final String name;
  final double size;
  final String type;

  StorageFile(this.name, this.size, this.type);
}