import 'package:flutter/material.dart';

import '../data/perfumes_data.dart';
import '../widgets/perfumes_card.dart';

class FilteredPerfumesPage extends StatelessWidget {
  final String categoryName;
  final String type;

  const FilteredPerfumesPage({
    super.key,
    required this.categoryName,
    required this.type,
  });

  String getBackground() {
    if (type == "luxury") return "images/a.png";
    if (type == "male") return "images/b.png";
    if (type == "female") return "images/c.png";
    return "images/a.png";
  }

  @override
  Widget build(BuildContext context) {
    final filtered = perfumesList.where((p) => p.type == type).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: const Color(0xFF690108),
        foregroundColor: Colors.black,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.73,
        ),
        itemCount: filtered.length,
        itemBuilder: (context, i) {
          return PerfumesCard(perfume: filtered[i]);
        },
      ),
    );
  }
}
