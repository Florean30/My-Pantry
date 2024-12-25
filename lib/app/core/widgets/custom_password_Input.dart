import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/modules/reset/reset_controller.dart';

// Widget untuk input email
class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetController>();
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Password field pertama
          Center(
            child: SizedBox(
              width: 300,
              height: 40,
              child: Obx(() {
                return TextFormField(
                  obscureText: controller.isNewPasswordVisible
                      .value, // Menambahkan ini untuk menyembunyikan password
                  decoration: InputDecoration(
                    labelText: 'New Password',
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
                    suffixIcon: Obx(() {
                      return GestureDetector(
                        onTap: () {
                          controller.isNewPasswordVisible.value =
                              !controller.isNewPasswordVisible.value;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            controller.isNewPasswordVisible.value
                                ? 'assets/images/icon/eyeoff.png'
                                : 'assets/images/icon/eyeon.png',
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

          // Password field kedua
          Center(
            child: SizedBox(
              width: 300,
              height: 40,
              child: Obx(() {
                return TextFormField(
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
                    suffixIcon: Obx(() {
                      return GestureDetector(
                        onTap: () {
                          controller.isConfirmPasswordVisible.value =
                              !controller.isConfirmPasswordVisible.value;
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            controller.isConfirmPasswordVisible.value
                                ? 'assets/images/icon/eyeoff.png'
                                : 'assets/images/icon/eyeon.png',
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
