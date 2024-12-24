import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'editprofile_controller.dart';
import 'package:mypantry_app/app/routes/home_routes.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/widgets/custom_text_field.dart';

// Halaman untuk edit profile
class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller untuk halaman edit profil
    final controller = Get.put(EditProfileController());

    return Scaffold(
      backgroundColor: AppColors.deepwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          // Form key untuk validasi form
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol kembali ke halaman sebelumnya
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
              // Judul halaman dan gambar profil
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
                  width: 150,
                  height: 150,
                ),
              ),
              // Field input untuk nama pengguna
              CustomTextField(
                label: 'Name',
                controller: controller.nameController,
                validator: controller.validateName, hintText: '',
              ),
              // Field input untuk email
              CustomTextField(
                label: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: controller.validateEmail, hintText: '',
              ),
              // Field input untuk password dengan toggle visibility
              CustomTextField(
                label: 'Password',
                controller: controller.passwordController,
                isPassword: true,
                validator: controller.validatePassword,
                suffixIcon: Obx(() {
                  // Toggle untuk menampilkan/menyembunyikan password
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
                }), hintText: '',
              ),
              // Field input untuk password baru dengan toggle visibility
              CustomTextField(
                label: 'New Password',
                controller: controller.repeatPasswordController,
                isPassword: true,
                validator: controller.validateRepeatPassword,
                suffixIcon: Obx(() {
                  // Toggle untuk menampilkan/menyembunyikan password baru
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
                }), hintText: '',
              ),
              const SizedBox(height: 40),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.offNamed(HomeRoutes.home);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orange,
                        ),
                      ),
                      Image.asset(
                        'assets/images/icon/save.png',
                        width: 40,
                        height: 40,
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
