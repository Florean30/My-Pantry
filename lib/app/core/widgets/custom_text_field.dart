import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class CustomTextField extends StatelessWidget {
  // Deklarasi variabel yang diperlukan
  final String label; // Label untuk field
  final String? initialValue; // Nilai awal field (opsional)
  final bool isPassword; // Mode password atau tidak
  final TextInputType? keyboardType; // Tipe keyboard
  final TextEditingController controller; // Controller untuk mengatur input
  final String? Function(String? value)? validator; // Fungsi validasi
  final Widget? suffixIcon; // Icon di bagian kanan field

  // Constructor
  const CustomTextField({
    super.key,
    required this.label,
    this.initialValue,
    this.isPassword = false,
    this.keyboardType,
    required this.controller,
    this.suffixIcon,
    this.validator, required String hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Widget untuk menampilkan label
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.orange,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 2),
          // Widget input field
          TextFormField(
            initialValue: initialValue,
            obscureText: isPassword, // Mengatur visibility text untuk password
            keyboardType: keyboardType, // Mengatur tipe keyboard
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
              suffixIcon: suffixIcon, // Menambahkan icon di bagian kanan
            ),
          ),
        ],
      ),
    );
  }
}
