import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'intro_controller.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

// Widget IntroPage yang merupakan tampilan intro/splash screen
class IntroPage extends GetView<IntroController> {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur warna latar belakang menggunakan AppColors.deepwhite
      backgroundColor: AppColors.deepwhite,
      // Menggunakan GetBuilder untuk membangun UI yang reaktif
      body: GetBuilder<IntroController>(
        builder: (controller) {
          // Menampilkan gambar splash-screen dari assets
          return Image.asset(
            'assets/images/splash-screen.jpg',
            // BoxFit.cover membuat gambar mengisi seluruh ruang yang tersedia
            fit: BoxFit.cover,
          );
        }
      ),
    );
  }
}