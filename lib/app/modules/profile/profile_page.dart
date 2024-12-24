import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';
import 'package:mypantry_app/app/routes/editprofile_routes.dart';
import 'package:mypantry_app/app/routes/login_routes.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/widgets/custom_text_field.dart';

// Halaman untuk profile
class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller untuk mengelola state dan logika
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColors.deepwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: controller.formKey, // Form key untuk validasi form
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol kembali ke halaman sebelumnya
              SafeArea(
                child: InkWell(
                  onTap: () => Get.back(),
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
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
              // Field input untuk email pengguna
              CustomTextField(
                label: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: controller.validateEmail, hintText: '',
              ),
              const SizedBox(height: 150),
              // Tombol untuk mengedit profil
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(EditprofileRoutes.editprofile);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orange,
                        ),
                      ),
                      Image.asset(
                        'assets/images/icon/edit.png',
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              // Tombol untuk logout
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(LoginRoutes.login);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.orange,
                        ),
                      ),
                      Image.asset(
                        'assets/images/icon/logout.png',
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
