import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'intro_controller.dart';

// Halaman yang menampilkan intro/splash screen
class IntroPage extends GetView<IntroController> {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur warna latar belakang menggunakan AppColors.deepwhite
      backgroundColor: AppColors.deepwhite,
      // Menggunakan GetBuilder untuk membangun UI yang reaktif
      body: GetBuilder<IntroController>(builder: (controller) {
        // Menampilkan gambar splash-screen dari assets
        return Image.asset(
          'assets/splash-screen.jpg',
          // BoxFit.cover membuat gambar mengisi seluruh ruang yang tersedia
          fit: BoxFit.cover,
        ).animate().fade().slideY(
              duration: const Duration(milliseconds: 800),
              begin: 2,
              curve: Curves.easeInSine,
            );
      }),
    );
  }
}
