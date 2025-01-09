import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/helpers/validator.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/core/widgets/custom_text_field.dart';
import 'editprofile_controller.dart';

// Halaman untuk edit profile
class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller untuk halaman edit profil
    final controller = Get.put(EditProfileController());

    return Scaffold(
      // Mengatur warna latar belakang scaffold
      backgroundColor: AppColors.deepwhite,
      body: SingleChildScrollView(
        // Mengatur padding halaman
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          // Form key untuk validasi form
          key: controller.formKey,
          child: Column(
            // Mengatur alignment konten
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
                      'assets/icon/back.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
                  'assets/icon/profile.png',
                  width: 150,
                  height: 150,
                ),
              ),
              // Menampilkan field input untuk data profil
              CustomTextField(
                // Field untuk nama
                label: 'Name',
                controller: controller.nameController,
                validator: Validator.required,
                hintText: '',
              ),
              CustomTextField(
                // Field untuk email
                label: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validator.email,
                hintText: '',
              ),

              // Field password dengan toggle visibility
              Obx(() {
                return CustomTextField(
                  label: 'Password',
                  controller: controller.passwordController,
                  isPassword: controller.isPasswordVisible.value,
                  validator: Validator.password,
                  // Tombol untuk toggle visibility password
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Toggle status visibility password
                      controller.isPasswordVisible.value =
                          !controller.isPasswordVisible.value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      // Icon untuk toggle password visibility
                      child: Image.asset(
                        controller.isPasswordVisible.value
                            ? 'assets/icon/eyeoff.png'
                            : 'assets/icon/eyeon.png',
                        width: 5,
                        height: 5,
                      ),
                    ),
                  ),
                  hintText: '',
                );
              }),

              // Field password baru dengan toggle visibility
              Obx(() {
                return CustomTextField(
                  label: 'New Password',
                  controller: controller.newPasswordController,
                  isPassword: controller.isNewPasswordVisible.value,
                  validator: Validator.password,
                  // Tombol untuk toggle visibility password baru
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Toggle status visibility password baru
                      controller.isNewPasswordVisible.value =
                          !controller.isNewPasswordVisible.value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      // Icon untuk toggle password visibility
                      child: Image.asset(
                        controller.isNewPasswordVisible.value
                            ? 'assets/icon/eyeoff.png'
                            : 'assets/icon/eyeon.png',
                        width: 5,
                        height: 5,
                      ),
                    ),
                  ),
                  hintText: '',
                );
              }),

              const SizedBox(height: 40),

              // Tombol simpan dengan indikator loading
              Center(
                child: TextButton(
                  onPressed: controller.updateProfile,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text yang berubah sesuai status loading
                      Obx(() {
                        return Text(
                          controller.isLoading.value ? 'Loading...' : 'Save',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.orange,
                          ),
                        );
                      }),
                      // Icon simpan
                      Image.asset(
                        'assets/icon/save.png',
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
