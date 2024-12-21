import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/widgets/custom_kategori_item_grid.dart';

class CustomKategoriGrid extends StatelessWidget {
  const CustomKategoriGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/buah.jpg",
            title: "Buah-buahan",
          ),
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/sayur.jpg",
            title: "Sayuran",
          ),
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/lauk.jpg",
            title: "Lauk Pauk",
          ),
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/kering.jpg",
            title: "Bumbu Kering",
          ),
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/basah.jpg",
            title: "Bumbu Basah",
          ),
        ],
      ),
    );
  }
}