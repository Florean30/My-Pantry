import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/routes/forgot_routes.dart';
import 'package:my_pantry/app/routes/register_routes.dart';
import 'login_controller.dart';

// Halaman untuk login
class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.deepwhite,
        body: Stack(children: [
          // Widget untuk menampilkan background image
          Positioned.fill(
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Widget scroll view untuk mengakomodasi keyboard
          SingleChildScrollView(
              child: Center(
            child: Container(
              // Container dengan lebar maksimum 360
              constraints: const BoxConstraints(maxWidth: 360),
              child: Form(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 68, vertical: 175),
                          child: Column(
                            children: [
                              // Widget untuk menampilkan logo aplikasi
                              Image.asset(
                                'assets/p-logo.png',
                                width: 130,
                                height: 130,
                              ),

                              // Widget untuk menampilkan judul aplikasi dengan dua warna
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'My',
                                      style: GoogleFonts.nunito(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Pantry',
                                      style: GoogleFonts.nunito(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 70),

                              // Form field untuk input email
                              TextFormField(
                                controller: controller.emailController,
                                cursorColor: AppColors.orange,
                                style: const TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  constraints: const BoxConstraints(
                                    maxHeight: 45,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  labelStyle: const TextStyle(
                                    color: AppColors.deepblack,
                                    fontSize: 14,
                                  ),
                                  filled: true,
                                  fillColor: AppColors.deepwhite,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 5),

                              // Form field untuk input password dengan fitur show/hide
                              Obx(() {
                                return TextFormField(
                                  cursorColor: AppColors.orange,
                                  controller: controller.passwordController,
                                  style: const TextStyle(fontSize: 14),
                                  obscureText:
                                      controller.isPasswordVisible.value,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    constraints: const BoxConstraints(
                                      maxHeight: 45,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    labelStyle: const TextStyle(
                                      color: AppColors.deepblack,
                                      fontSize: 14,
                                    ),
                                    filled: true,
                                    fillColor: AppColors.deepwhite,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide: BorderSide.none,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.togglePasswordVisibility();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Image.asset(
                                          controller.isPasswordVisible.value
                                              ? 'assets/icon/eyeoff.png'
                                              : 'assets/icon/eyeon.png',
                                          width: 5,
                                          height: 5,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),

                              // Widget untuk link lupa password
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(ForgotRoutes.forgot);
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 30),

                              // Tombol login dengan indikator loading
                              ElevatedButton(
                                onPressed: controller.login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.orange,
                                  minimumSize: const Size(80, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 5,
                                  ),
                                ),
                                child: Obx(() {
                                  return Text(
                                    controller.isLoading.value
                                        ? 'Loading...'
                                        : 'Login',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  );
                                }),
                              ),

                              const SizedBox(height: 10),

                              // Widget untuk link registrasi dengan text yang bisa diklik
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Don't have an account? ",
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Register',
                                      style: const TextStyle(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.black,
                                        decorationThickness: 2,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.toNamed(RegisterRoutes.register);
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
        ]));
  }
}
