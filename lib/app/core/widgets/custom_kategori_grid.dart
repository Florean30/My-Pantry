import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/widgets/custom_kategori_item_grid.dart';

// Widget untuk menampilkan grid kategori secara horizontal
class CustomKategoriGrid extends StatelessWidget {
  const CustomKategoriGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan SingleChildScrollView untuk membuat konten dapat di-scroll horizontal
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      // Menggunakan Row untuk menata item kategori secara horizontal
      child: Row(
        children: [
          // Item kategori untuk Buah-buahan
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/buah.jpg",
            title: "Buah-buahan",
          ),
          // Item kategori untuk Sayuran
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/sayur.jpg",
            title: "Sayuran",
          ),
          // Item kategori untuk Lauk Pauk
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/lauk.jpg",
            title: "Lauk Pauk",
          ),
          // Item kategori untuk Bumbu Kering
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/kering.jpg",
            title: "Bumbu Kering",
          ),
          // Item kategori untuk Bumbu Basah
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/basah.jpg",
            title: "Bumbu Basah",
          ),
        ],
      ),
    );
  }
}
