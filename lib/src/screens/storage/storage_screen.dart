import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../widgets/card_container.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 8),
        _buildStorageOverview(context),
        const SizedBox(height: 16),
        _buildStorageCategories(context),
        const SizedBox(height: 16),
        _buildLargeFiles(context),
      ],
    );
  }

  Widget _buildStorageOverview(BuildContext context) {
    return CardContainer(
      child: Column(
        children: [
          _buildPieChart(context),
          const SizedBox(height: 16),
          Text(
            'Storage Usage',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            '32.5 GB free of 128 GB',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildPieChart(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 95.5,
              color: Theme.of(context).colorScheme.primary,
              title: '74.6%',
              radius: 50,
              titleStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            PieChartSectionData(
              value: 32.5,
              color: Theme.of(context).colorScheme.surfaceVariant,
              title: '25.4%',
              radius: 45,
              titleStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          sectionsSpace: 2,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }

  Widget _buildStorageCategories(BuildContext context) {
    final categories = [
      ('Apps', Icons.apps, 45.2),
      ('Images', Icons.image, 28.4),
      ('Videos', Icons.video_library, 12.8),
      ('Documents', Icons.description, 9.1),
    ];

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ...categories.map((category) => _buildCategoryItem(
                context,
                category.$1,
                category.$2,
                category.$3,
              )),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context,
    String title,
    IconData icon,
    double size,
  ) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      trailing: Text(
        '${size.toStringAsFixed(1)} GB',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
    );
  }

  Widget _buildLargeFiles(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Large Files',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildFileItem(
            context,
            'Video.mp4',
            '1.2 GB',
            Icons.video_file,
          ),
          _buildFileItem(
            context,
            'Document.pdf',
            '856 MB',
            Icons.picture_as_pdf,
          ),
          _buildFileItem(
            context,
            'Image.jpg',
            '425 MB',
            Icons.image,
          ),
        ],
      ),
    );
  }

  Widget _buildFileItem(
    BuildContext context,
    String name,
    String size,
    IconData icon,
  ) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(name),
      subtitle: Text(size),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {},
      ),
    );
  }
}