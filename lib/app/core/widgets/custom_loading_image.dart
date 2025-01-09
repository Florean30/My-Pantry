import 'package:flutter/material.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';

// Widget untuk menampilkan loading indicator berbentuk lingkaran
class LoadingImageWidget extends StatelessWidget {
  // Constructor dengan parameter key yang opsional
  const LoadingImageWidget({
    super.key,
  });

  // Method build untuk membangun tampilan widget
  @override
  Widget build(BuildContext context) {
    // Mengembalikan container dengan ukuran tetap
    return const SizedBox(
      width: 25, // Lebar container
      height: 25, // Tinggi container
      child: CircularProgressIndicator(
        // Warna loading indicator menggunakan warna orange dari AppColors
        color: AppColors.orange, 
      ),
    );
  }
}
