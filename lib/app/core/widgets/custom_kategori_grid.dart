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
            imagePath: "assets/images/kategori/buah.png",
            title: "Buah-buahan",
          ),
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/sayur.png",
            title: "Sayuran",
          ),
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/lauk.png",
            title: "Lauk Pauk",
          ),
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/kering.png",
            title: "Bumbu Kering",
          ),
          CustomKategoriItemGrid(
            imagePath: "assets/images/kategori/basah.png",
            title: "Bumbu Basah",
          ),
        ],
      ),
    );
  }
}