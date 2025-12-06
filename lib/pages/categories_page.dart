import 'package:flutter/material.dart';

import 'filtered_perfumes_page.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  final List<Map<String, dynamic>> categories = [
    {
      "name": "عطور رجالية",
      "enabled": true,
      "icon": Icons.male,
      "type": "male",
    },
    {
      "name": "عطور نسائية",
      "enabled": true,
      "icon": Icons.female,
      "type": "female",
    },
    {
      "name": "عطور فاخرة",
      "enabled": true,
      "icon": Icons.star_rate,
      "type": "luxury",
    },

    {"name": "عطور عربية", "enabled": false, "icon": Icons.oil_barrel},
    {"name": "عطور غربية", "enabled": false, "icon": Icons.public},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("التصنيفات")),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: categories.length,

        itemBuilder: (context, index) {
          final cat = categories[index];
          final bool enabled = cat["enabled"] as bool;

          return Opacity(
            opacity: enabled ? 1 : 0.4,
            child: Card(
              color: const Color(0xFFFCF1DB),
              child: ListTile(
                leading: Icon(
                  cat["icon"],
                  color: const Color(0xFF690108),
                  size: 32,
                ),

                title: Text(
                  cat["name"],
                  style: const TextStyle(
                    color: Color(0xFF690108),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                trailing: enabled
                    ? const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF690108),
                        size: 16,
                      )
                    : const Icon(
                        Icons.lock,
                        color: Color(0xFF690108),
                        size: 18,
                      ),

                onTap: enabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FilteredPerfumesPage(
                              categoryName: cat["name"],
                              type: cat["type"],
                            ),
                          ),
                        );
                      }
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
