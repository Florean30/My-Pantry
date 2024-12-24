import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Form key untuk validasi
  final formKey = GlobalKey<FormState>();

  // Text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi data awal jika ada
    loadUserData();
  }

  @override
  void onClose() {
    // Dispose controllers untuk mencegah memory leak
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }

  // Fungsi untuk memuat data user
  void loadUserData() {
    // Contoh dummy data
    nameController.text = "John Doe";
    emailController.text = "johndoe@example.com";
  }

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

  // Fungsi untuk update profile
  void updateProfile() {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        'Sukses',
        'Profile berhasil diperbarui',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Fungsi untuk logout
  void logout() {
    // Contoh: Clear storage, reset state, dll
    Get.offAllNamed('/login'); // Navigate ke halaman login
  }
}
