import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/routes/home_routes.dart';
import 'editprofile_controller.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/widgets/custom_text_field.dart';


class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());

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
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Image.asset(
                  'assets/images/icon/profile.png',
                  width: 110,
                  height: 110,
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
                label: 'New Password',
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
                        controller.isRepeatPasswordVisible.value
                            ? 'assets/images/icon/eyeoff.png'
                            : 'assets/images/icon/eyeon.png',
                        width: 5,
                        height: 5,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 60),
               Center(
                child: TextButton(
                  onPressed: () {
                    Get.offNamed(HomeRoutes.home);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.orange,
                        ),
                      ),
                      Image.asset(
                        'assets/images/icon/save.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
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
