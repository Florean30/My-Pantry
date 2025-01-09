import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/routes/activity_history_routes.dart';
import 'package:my_pantry/app/routes/home_routes.dart';

// Widget kustom untuk footer pada halaman home
class CustomFooterHome extends StatelessWidget {
  const CustomFooterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Mengatur lebar footer sesuai dengan lebar layar
      width: MediaQuery.of(context).size.width,
      child: Container(
        // Mengatur warna latar belakang footer
        color: AppColors.freshgreen,
        // Memberikan padding pada konten footer
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        child: Row(
          // Mengatur posisi item agar berada di ujung-ujung container
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Tombol untuk navigasi ke halaman Activity
            GestureDetector(
              onTap: () {
                Get.toNamed(ActivityHistoryRoutes.activityHistory);
              },
              child: Image.asset(
                'assets/icon/activity.png',
                width: 70,
                height: 70,
                fit: BoxFit.contain,
                semanticLabel: 'Activity', // Label untuk accessibility
              ),
            ),
            // Tombol untuk navigasi ke halaman Home
            GestureDetector(
              onTap: () {
                Get.toNamed(HomeRoutes.home);
              },
              child: Image.asset(
                'assets/icon/home.png',
                width: 55,
                height: 55,
                fit: BoxFit.contain,
                semanticLabel: 'Home', // Label untuk accessibility
              ),
            ),
          ],
        ),
      ),
    );
  }
}
