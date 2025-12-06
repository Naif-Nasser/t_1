import 'package:flutter/material.dart';

import '../data/perfumes_data.dart';
import '../widgets/perfumes_card.dart';
import 'account_page.dart';
import 'categories_page.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final pages = [
    const HomeContent(),
    CategoriesPage(),
    const SearchPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        selectedItemColor: const Color(0xFF690108),
        unselectedItemColor: Colors.black54,
        backgroundColor: const Color(0xFFFCF1DB),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "الأقسام"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "بحث"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "حسابي"),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  final List<String> bgImages = const [
    'images/a.jpg',
    'images/b.jpg',
    'images/c.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("متجر العطور"),
        backgroundColor: const Color(0xFF690108),
        foregroundColor: Colors.black87,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.73,
        ),
        itemCount: perfumesList.length,
        itemBuilder: (context, i) {
          String bg = bgImages[i % bgImages.length];
          return PerfumesCard(perfume: perfumesList[i]);
        },
      ),
    );
  }
}
