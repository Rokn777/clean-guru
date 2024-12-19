class StorageData {
  final double totalSpace;
  final double usedSpace;
  final List<StorageItem> items;

  StorageData({
    required this.totalSpace,
    required this.usedSpace,
    required this.items,
  });

  double get freeSpace => totalSpace - usedSpace;
  double get usagePercentage => (usedSpace / totalSpace) * 100;
}

class StorageItem {
  final String name;
  final String type;
  final double size;
  final DateTime lastModified;

  StorageItem({
    required this.name,
    required this.type,
    required this.size,
    required this.lastModified,
  });
}