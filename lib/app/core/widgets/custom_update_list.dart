import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/widgets/custom_update_card.dart';

class CustomUpdateList extends StatelessWidget {
  const CustomUpdateList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 480),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: const Column(
          children: [
            CustomUpdateCard(
              title: 'Sayuran',
              count: 30,
              imagePath: 'assets/images/kategori/sayuran.png',
            ),
            SizedBox(height: 19),
            CustomUpdateCard(
              title: 'Bumbu Kering',
              count: 24,
              imagePath: 'assets/images/kategori/bumbu_kering.png',
            ),
            SizedBox(height: 19),
            CustomUpdateCard(
              title: 'Lauk Pauk',
              count: 13,
              imagePath: 'assets/images/kategori/lauk_pauk.png',
            ),
            SizedBox(height: 19),
            CustomUpdateCard(
              title: 'Buah-buahan',
              count: 6,
              imagePath: 'assets/images/kategori/buah_buahan.png',
            ),
            SizedBox(height: 19),
            CustomUpdateCard(
              title: 'Bumbu Basah',
              count: 8,
              imagePath: 'assets/images/kategori/bumbu_basah.png',
            ),
          ],
        ),
      ),
    );
  }
}