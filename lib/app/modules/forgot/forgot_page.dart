import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'forgot_controller.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/routes/verification_routes.dart';
import 'package:mypantry_app/app/core/widgets/custom_forgot.dart';

// Halaman untuk lupa password
class ForgotPage extends GetView<ForgotController> {
  const ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur warna latar belakang halaman
      backgroundColor: AppColors.deepwhite,
      body: SingleChildScrollView(
        child: Padding(
          // Memberikan padding horizontal 16
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Spacing atas
              const SizedBox(height: 16),
              // Widget untuk tombol kembali
              SafeArea(
                child: InkWell(
                  onTap: () {
                    // Kembali ke halaman sebelumnya
                    Get.back();
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/icon/back.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Judul halaman
              const Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 34),
              // Widget input email (custom widget)
              const EmailInput(),
              const SizedBox(height: 230),
              // Tombol Get OTP
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman verifikasi
                  Get.toNamed(VerificationRoutes.verification);
                },
                // Styling tombol
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  minimumSize: const Size(80, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 5,
                  ),
                ),
                child: const Text(
                  'Get OTP',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
