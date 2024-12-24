import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_controller.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/widgets/custom_text_field.dart';

// Halaman untuk register
class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller menggunakan GetX
    final controller = Get.put(RegisterController());

    return Scaffold(
      // Mengatur warna latar belakang
      backgroundColor: AppColors.deepwhite,
      body: SingleChildScrollView(
        // Menambahkan padding horizontal dan vertikal
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          // Membuat form dengan key untuk validasi
          key: controller.formKey,
          child: Column(
            // Mengatur posisi elemen secara vertikal
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol kembali dengan gambar
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
              const SizedBox(height: 40),
              // Judul halaman Register
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
              const SizedBox(height: 5),
              // Gambar profil
              Center(
                child: Image.asset(
                  'assets/images/icon/profile.png',
                  width: 150,
                  height: 150,
                ),
              ),
              // Input field untuk nama
              CustomTextField(
                label: 'Name',
                controller: controller.nameController,
                validator: controller.validateName,
                hintText: 'Enter your name',
              ),
              // Input field untuk email
              CustomTextField(
                label: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: controller.validateEmail,
                hintText: 'Enter your email',
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 27),
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: AppColors.orange,
                    fontSize: 14,
                  ),
                ),
              ),
              Obx(() {
                return TextFormField(
                  obscureText: controller.isPasswordVisible
                      .value, // Mengatur visibility text untuk password

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.lightgreen,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    // Mengatur border dan radius
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Obx(
                      () {
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
                      }, // Menambahkan icon di bagian kanan
                    ),
                  ),
                );
              }), // Field input ulang password
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 27),
                child: Text(
                  'Repeat Password',
                  style: TextStyle(
                    color: AppColors.orange,
                    fontSize: 14,
                  ),
                ),
              ),
              Obx(() {
                return TextFormField(
                  obscureText: controller.isRepeatPasswordVisible.value, // Mengatur visibility text untuk password

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.lightgreen,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    // Mengatur border dan radius
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Obx(
                      () {
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
                      }, // Menambahkan icon di bagian kanan
                    ),
                  ),
                );
              }),
              const SizedBox(height: 50),
              // Tombol Register
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
                      horizontal: 40,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
