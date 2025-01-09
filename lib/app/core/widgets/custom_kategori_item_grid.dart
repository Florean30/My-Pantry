import 'package:flutter/material.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';

// Widget kustom untuk menampilkan item kategori dalam bentuk grid
class CustomKategoriItemGrid extends StatelessWidget {
  // Parameter untuk menyimpan path gambar
  final String imagePath;
  final String title;

  const CustomKategoriItemGrid({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Dekorasi container utama dengan gradient transparan ke hijau
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Color.fromARGB(200, 0, 100, 0),
          ],
          stops: [0.6, 1.0],
        ),
      ),
      margin: const EdgeInsets.only(right: 12),
      width: 250,
      // Stack untuk menumpuk gambar, gradient, dan teks
      child: Stack(
        children: [
          // Layer 1: Gambar kategori yang mengisi seluruh container
          Positioned.fill(
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          // Layer 2: Gradient overlay untuk memberikan efek gelap pada gambar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.darkgreen.withValues(alpha: 0.1),
                    AppColors.darkgreen.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
          ),
          // Layer 3: Teks judul kategori di bagian bawah
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
