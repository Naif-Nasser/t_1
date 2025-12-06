import 'package:flutter/material.dart';

import '../data/perfumes_data.dart';
import '../widgets/perfumes_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchText = "";

  final List<String> bgImages = const [
    'images/a.jpg',
    'images/b.jpg',
    'images/c.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var filtered = perfumesList
        .where((p) => p.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("البحث"),
        backgroundColor: const Color(0xFF690108),
        foregroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Color(0xFF690108)),
                hintText: "ابحث عن عطر...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (v) => setState(() => searchText = v),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.73,
              ),
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                String bg = bgImages[i % bgImages.length];
                return PerfumesCard(perfume: filtered[i]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
