import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

// Widget untuk input email
class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Password field pertama
          Center(
            child: SizedBox(
              width: 300,
              height: 40,
              child: TextFormField(
                obscureText:
                    true, // Menambahkan ini untuk menyembunyikan password
                decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: const TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: AppColors.lightgreen,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                  // suffixIcon: GestureDetector(
                  //   onTap: () {
                  //     controller.togglePasswordVisibility();
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(12.0),
                  //     child: Image.asset(
                  //       controller.isPasswordVisible.value
                  //           ? 'assets/images/icon/eyeoff.png'
                  //           : 'assets/images/icon/eyeon.png',
                  //       width: 5,
                  //       height: 5,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),

          // Password field kedua
          Center(
            child: SizedBox(
              width: 300,
              height: 40,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: AppColors.lightgreen,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                  // suffixIcon: GestureDetector(
                  //   onTap: () {
                  //     controller.toggleRepeatPasswordVisibility();
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(12.0),
                  //     child: Image.asset(
                  //       controller.isRepeatPasswordVisible.value
                  //           ? 'assets/images/icon/eyeoff.png'
                  //           : 'assets/images/icon/eyeon.png',
                  //       width: 5,
                  //       height: 5,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
