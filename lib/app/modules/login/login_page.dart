import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/routes/forgot_routes.dart';
import 'package:mypantry_app/app/routes/home_routes.dart';
import 'package:mypantry_app/app/routes/register_routes.dart';
import 'login_controller.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.deepwhite,
        body: Stack(children: [
          // Background Image 
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png', 
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
              child: Center(
            child: Container(
              // Membatasi lebar maksimum konten menjadi 360
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
                              // Logo aplikasi
                              Image.asset(
                                'assets/images/p-logo.png',
                                width: 130,
                                height: 130,
                              ),
                              
                              // Judul aplikasi dengan 2 warna berbeda
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
                              
                              // Input field untuk email
                              SizedBox(
                                width: 400,
                                height: 40,
                                child: TextFormField(
                                  style: GoogleFonts.nunito(fontSize: 14),
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: GoogleFonts.nunito(
                                      color: AppColors.black,
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
                              ),

                              const SizedBox(height: 5),
                              
                              // Input field untuk password dengan toggle visibility
                              Obx(() {
                                return SizedBox(
                                  width: 400,
                                  height: 40,
                                  child: TextFormField(
                                    controller: controller.passwordController,
                                    style: GoogleFonts.nunito(fontSize: 14),
                                    obscureText:
                                        controller.isPasswordVisible.value,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: GoogleFonts.nunito(
                                        color: AppColors.black,
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
                                                ? 'assets/images/icon/eyeoff.png'
                                                : 'assets/images/icon/eyeon.png',
                                            width: 5,
                                            height: 5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),

                              // Link forgot password
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(ForgotRoutes.forgot);
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: GoogleFonts.nunito(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 30),
                              
                              // Tombol Login
                              ElevatedButton(
                                onPressed: () {Get.offAllNamed(HomeRoutes.home);},
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
                                  'Login',
                                  style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),
                              
                              // Link untuk register akun baru
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Don't have an account? ",
                                      style: GoogleFonts.nunito(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Register',
                                      style: GoogleFonts.nunito(
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
