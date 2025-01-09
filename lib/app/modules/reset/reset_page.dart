import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/core/widgets/custom_password_Input.dart';
import 'package:my_pantry/app/routes/login_routes.dart';
import 'reset_controller.dart';

// Halaman untuk mereset password
class ResetPage extends GetView<ResetController> {
  const ResetPage({super.key});

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
                      'assets/icon/back.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Judul halaman
              const Text(
                'New Password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 34),
              // Widget input email (custom widget)
              const PasswordInput(),
              const SizedBox(height: 230),
              // Tombol Get OTP
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman verifikasi
                  Get.toNamed(LoginRoutes.login);
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
                  'Submit',
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
