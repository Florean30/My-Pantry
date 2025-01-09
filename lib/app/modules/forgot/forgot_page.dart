import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/core/widgets/custom_forgot.dart';
import 'package:my_pantry/app/routes/verification_routes.dart';
import 'forgot_controller.dart';

// Halaman untuk lupa password
class ForgotPage extends GetView<ForgotController> {
  const ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Membangun tampilan utama
    return Scaffold(
      // Mengatur warna latar belakang halaman
      backgroundColor: AppColors.deepwhite,
      // Menggunakan ScrollView agar konten dapat di-scroll
      body: SingleChildScrollView(
        child: Padding(
          // Memberikan padding horizontal 16
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // Kolom utama untuk menampung semua widget
          child: Column(
            children: [
              // Spacing atas
              const SizedBox(height: 16),
              // Widget untuk tombol kembali menggunakan SafeArea
              SafeArea(
                child: InkWell(
                  // Fungsi ketika tombol ditekan
                  onTap: () {
                    // Kembali ke halaman sebelumnya
                    Get.back();
                  },
                  // Mengatur posisi dan gambar tombol kembali
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
              // Jarak antara tombol kembali dan judul
              const SizedBox(height: 30),
              // Judul halaman "Forgot Password"
              const Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              // Jarak antara judul dan input email
              const SizedBox(height: 34),
              // Widget kustom untuk input email
              const EmailInput(),
              // Jarak antara input email dan tombol
              const SizedBox(height: 230),
              // Tombol Get OTP
              ElevatedButton(
                // Fungsi ketika tombol ditekan
                onPressed: () {
                  // Navigasi ke halaman verifikasi
                  Get.toNamed(VerificationRoutes.verification);
                },
                // Mengatur tampilan tombol
                style: ElevatedButton.styleFrom(
                  // Warna latar belakang tombol
                  backgroundColor: AppColors.orange,
                  // Ukuran minimum tombol
                  minimumSize: const Size(80, 40),
                  // Bentuk tombol dengan sudut melengkung
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  // Padding internal tombol
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 5,
                  ),
                ),
                // Teks pada tombol
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
