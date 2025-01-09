import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/modules/reset/reset_controller.dart';

// Widget untuk input email
class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller untuk mengatur state password
    final controller = Get.find<ResetController>();
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Widget input password baru
          Center(
            child: SizedBox(
              width: 300,
              height: 40,
              child: Obx(() {
                return TextFormField(
                  // Mengatur visibilitas password berdasarkan state
                  obscureText: controller.isNewPasswordVisible.value,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    labelStyle: const TextStyle(
                      color: AppColors.deepblack,
                      fontSize: 14,
                    ),
                    // Mengatur tampilan background field
                    filled: true,
                    fillColor: AppColors.lightgreen,
                    // Mengatur border field menjadi rounded
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    // Widget untuk toggle visibility password
                    suffixIcon: Obx(() {
                      return GestureDetector(
                        // Handler untuk mengubah state visibility password
                        onTap: () {
                          controller.isNewPasswordVisible.value =
                              !controller.isNewPasswordVisible.value;
                        },
                        // Icon untuk toggle visibility
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            // Mengubah icon berdasarkan state visibility
                            controller.isNewPasswordVisible.value
                                ? 'assets/icon/eyeoff.png'
                                : 'assets/icon/eyeon.png',
                            width: 5,
                            height: 5,
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 5),

          // Widget input konfirmasi password
          Center(
            child: SizedBox(
              width: 300,
              height: 40,
              child: Obx(() {
                return TextFormField(
                  // Mengatur visibilitas konfirmasi password
                  obscureText: controller.isConfirmPasswordVisible.value,
                  decoration: InputDecoration(
                    labelText: 'Repeat Password',
                    labelStyle: const TextStyle(
                      color: AppColors.deepblack,
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: AppColors.lightgreen,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    // Widget untuk toggle visibility konfirmasi password
                    suffixIcon: Obx(() {
                      return GestureDetector(
                        // Handler untuk mengubah state visibility konfirmasi password
                        onTap: () {
                          controller.isConfirmPasswordVisible.value =
                              !controller.isConfirmPasswordVisible.value;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            // Mengubah icon berdasarkan state visibility
                            controller.isConfirmPasswordVisible.value
                                ? 'assets/icon/eyeoff.png'
                                : 'assets/icon/eyeon.png',
                            width: 5,
                            height: 5,
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
