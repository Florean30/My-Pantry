import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/core/widgets/custom_verification_code_input.dart';
import 'package:my_pantry/app/core/widgets/custom_verification_timer.dart';
import 'package:my_pantry/app/routes/reset_routes.dart';
import 'verification_controller.dart';

// Halaman untuk verifikasi
class VerificationPage extends GetView<VerificationController> {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepwhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol kembali di pojok kiri atas
              SafeArea(
                child: InkWell(
                  onTap: () {
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
              const Center(
                child: Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Widget timer verifikasi
              const Center(child: VerificationTimer()),
              const SizedBox(height: 20),

              // Widget input kode verifikasi
              const VerificationCodeInput(),
              const SizedBox(height: 20),

              // Teks petunjuk
              const Center(
                child: Text(
                  'Enter your code from the email we send you.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 160),

              // Tombol Submit
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.offNamed(ResetRoutes.reset);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
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
                      color: AppColors.deepwhite,
                    ),
                  ),
                ),
              ),

              // Tombol Resend
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        // Teks "I didn't receive the code!"
                        TextSpan(
                          text: "I didn't receive the code! ",
                          style: TextStyle(
                            color: AppColors.deepblack,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Teks "Resend" dengan garis bawah
                        TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                            color: AppColors.deepblack,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.deepblack,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
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
