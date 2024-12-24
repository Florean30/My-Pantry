import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  // Observable untuk visibility password
  final isPasswordVisible = false.obs;
  final isRepeatPasswordVisible = false.obs;

  // Validasi nama
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  // Validasi email
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Masukkan email yang valid';
    }
    return null;
  }

  // Validasi password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  // Validasi repeat password
  String? validateRepeatPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value != passwordController.text) {
      return 'Password tidak sama';
    }
    return null;
  }

  // Method untuk update profile
  void updateProfile() {
    if (formKey.currentState!.validate()) {
      Get.back(); // Kembali ke halaman sebelumnya setelah berhasil update
      Get.snackbar(
        'Sukses',
        'Profile berhasil diperbarui',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    // Dispose semua controller
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.onClose();
  }
}
