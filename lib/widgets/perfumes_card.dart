import 'package:flutter/material.dart';

import '../models/perfume_model.dart';
import '../pages/product_details_page.dart';

class PerfumesCard extends StatelessWidget {
  final PerfumeModel perfume;

  const PerfumesCard({super.key, required this.perfume});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(perfume: perfume),
          ),
        );
      },
      child: Card(
        color: const Color(0xFFFCF1DB),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage(perfume.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              perfume.name,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 4),

            Text(
              "${perfume.price} ر.س",
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
