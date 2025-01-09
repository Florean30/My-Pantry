import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';

// Widget untuk membuat text field dengan style tertentu
class CustomTextField extends StatelessWidget {
  // Deklarasi variabel yang diperlukan
  final String label; // Label untuk field
  final String? initialValue; // Nilai awal field (opsional)
  final bool isPassword; // Mode password atau tidak
  final TextInputType? keyboardType; // Tipe keyboard
  final TextEditingController? controller; // Controller untuk mengatur input
  final String? Function(String? value)? validator; // Fungsi validasi
  final Widget? suffixIcon; // Icon di bagian kanan field
  final String hintText; // Text hint
  final bool enabled; // Mode enabled atau tidak
  // Constructor
  const CustomTextField({
    super.key,
    required this.label,
    this.initialValue,
    this.isPassword = false,
    this.keyboardType,
    this.controller,
    this.suffixIcon,
    this.validator,
    required this.hintText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
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
            enabled: enabled,
            controller: controller,
            initialValue: initialValue,
            obscureText: isPassword, // Mengatur visibility text untuk password
            keyboardType: keyboardType, // Mengatur tipe keyboard
            decoration: InputDecoration(
              hintText: hintText,
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
            validator: validator,
          ),
        ],
      ),
    );
  }
}

// Widget untuk membuat text form field sederhana dengan border outline
class CustomSimpleTextForm extends StatelessWidget {
  // Deklarasi variabel yang diperlukan
  final TextEditingController? controller; // Controller untuk mengatur input
  final String label; // Label untuk field
  final int? maxLines; // Jumlah maksimum baris
  final String? prefixText; // Teks awalan
  final TextInputType? keyboardType; // Tipe keyboard
  final String? Function(String?)? validator; // Fungsi validasi
  final String? suffixText; // Teks akhiran
  final void Function()? onTap; // Fungsi ketika field di tap
  final Function(String)? onChanged; // Fungsi ketika nilai berubah
  final bool? readOnly; // Mode read-only
  final Widget? suffixIcon; // Icon di bagian kanan
  final Widget? prefixIcon; // Icon di bagian kiri
  final List<TextInputFormatter>?
      inputFormatters; // Format input yang diizinkan
  final String? initialValue; // Nilai awal
  final BoxConstraints? constraints; // Batasan ukuran widget
  final bool? isFilled; // Mode filled atau tidak
  final bool? enabled; // Mode enabled atau tidak

  const CustomSimpleTextForm({
    super.key,
    this.controller,
    required this.label,
    this.maxLines,
    this.prefixText,
    this.keyboardType,
    this.validator,
    this.suffixText,
    this.onTap,
    this.readOnly,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.initialValue,
    this.onChanged,
    this.constraints,
    this.isFilled,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      style: const TextStyle(color: Colors.black, fontSize: 14),
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      readOnly: readOnly ?? false,
      onTap: onTap,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        constraints: constraints,
        labelText: label,
        prefixText: prefixText,
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelStyle: const TextStyle(color: AppColors.freshgreen),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.freshgreen),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.freshgreen),
        ),
        filled: isFilled ?? true,
        fillColor: Colors.grey[50],
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}

// Widget untuk membuat text form field sederhana dengan background transparan
class CustomSimpleTextForm2 extends StatelessWidget {
  // Deklarasi variabel yang sama dengan CustomSimpleTextForm
  final TextEditingController? controller;
  final String label;
  final int? maxLines;
  final String? prefixText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? suffixText;
  final void Function()? onTap;
  final Function(String)? onChanged;
  final bool? readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final BoxConstraints? constraints;
  final bool? isFilled;
  final bool? enabled;

  const CustomSimpleTextForm2({
    super.key,
    this.controller,
    required this.label,
    this.maxLines,
    this.prefixText,
    this.keyboardType,
    this.validator,
    this.suffixText,
    this.onTap,
    this.readOnly,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.initialValue,
    this.onChanged,
    this.constraints,
    this.isFilled,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      style: const TextStyle(color: Colors.black, fontSize: 14),
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      readOnly: readOnly ?? false,
      onTap: onTap,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        focusColor: Colors.transparent,
        contentPadding: const EdgeInsets.all(10),
        constraints: constraints,
        labelText: label,
        prefixText: prefixText,
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelStyle: const TextStyle(color: AppColors.freshgreen),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.freshgreen),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color.fromARGB(20, 0, 0, 0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.freshgreen),
        ),
        filled: true,
        fillColor: Colors.transparent,
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
