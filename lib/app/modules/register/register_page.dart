import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'register_controller.dart';
import 'package:mypantry_app/app/core/widgets/custom_text_field.dart';
import 'package:mypantry_app/app/core/widgets/custom_submit_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: AppColors.deepwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: controller.formKey, // Tambahkan form key
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/icon/back.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 41),
              const Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 43),
              Center(
                child: Image.asset(
                  'assets/images/icon/profile.png',
                  width: 80,
                  height: 80,
                ),
              ),
              CustomTextField(
                label: 'Name',
                controller: controller.nameController,
                validator: controller.validateName,
              ),
              CustomTextField(
                label: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: controller.validateEmail,
              ),
              CustomTextField(
                label: 'Password',
                controller: controller.passwordController,
                isPassword: true,
                validator: controller.validatePassword,
                suffixIcon: Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.isPasswordVisible.value =
                          !controller.isPasswordVisible.value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        controller.isPasswordVisible.value
                            ? 'assets/images/icon/eyeoff.png'
                            : 'assets/images/icon/eyeon.png',
                        width: 5,
                        height: 5,
                      ),
                    ),
                  );
                }),
              ),
              CustomTextField(
                label: 'Repeat Password',
                controller: controller.repeatPasswordController,
                isPassword: true,
                validator: controller.validateRepeatPassword,
                suffixIcon: Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.isRepeatPasswordVisible.value =
                          !controller.isRepeatPasswordVisible.value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        controller.isPasswordVisible.value
                            ? 'assets/images/icon/eyeoff.png'
                            : 'assets/images/icon/eyeon.png',
                        width: 5,
                        height: 5,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 138),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    minimumSize: const Size(80, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 10,
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
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
