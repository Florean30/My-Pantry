import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller untuk halaman registrasi
class RegisterController extends GetxController {
  // Key untuk form validation
  final formKey = GlobalKey<FormState>();

  // Controller untuk input field
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  // Observable boolean untuk toggle visibility password
  final isPasswordVisible = false.obs;
  final isRepeatPasswordVisible = false.obs;

  // Membersihkan controller saat widget dihapus
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.onClose();
  }

  // Validasi input nama
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  // Validasi format email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    // Menggunakan GetUtils untuk validasi format email
    if (!GetUtils.isEmail(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  // Validasi password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    // Memastikan password minimal 6 karakter
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  // Validasi konfirmasi password
  String? validateRepeatPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ulangi password tidak boleh kosong';
    }
    // Memastikan password yang diulang sama dengan password pertama
    if (value != passwordController.text) {
      return 'Password tidak sama';
    }
    return null;
  }
}
