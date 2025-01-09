import 'package:flutter/material.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';

// Widget untuk input email
class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container untuk input field email
          Center(
            child: SizedBox(
              width: 300, // Lebar tetap untuk input field
              height: 40, // Tinggi tetap untuk input field
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: AppColors.deepblack,
                    fontSize: 14,
                  ),
                  // Mengatur tampilan background input field
                  filled: true,
                  fillColor: AppColors.lightgreen,
                  // Mengatur border input field menjadi rounded
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          // Jarak antara input field dan text
          const SizedBox(height: 13),
          // Text informasi dibawah input field
          const Center(
            child: Text(
              'A code will be sent to your email.',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
