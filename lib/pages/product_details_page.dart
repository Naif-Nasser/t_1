import 'package:flutter/material.dart';

import '../models/perfume_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final PerfumeModel perfume;

  const ProductDetailsPage({super.key, required this.perfume});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(perfume.name)),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 320,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(perfume.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              perfume.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF690108),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "${perfume.price} ر.س",
              style: const TextStyle(
                fontSize: 22,
                color: Color(0xFF690108),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "الوصف",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF690108),
              ),
            ),

            const SizedBox(height: 10),

            Text(perfume.description, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF690108),
                  padding: const EdgeInsets.all(14),
                ),

                onPressed: () {},

                child: const Text(
                  "أضف إلى السلة",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
