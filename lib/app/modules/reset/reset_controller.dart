import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller untuk menangani logika reset password
class ResetController extends GetxController {
  // Key untuk form validation
  final formKey = GlobalKey<FormState>();
  // Controller untuk input password
  final passwordController = TextEditingController();
  // Controller untuk input konfirmasi password
  final confirmPasswordController = TextEditingController();
  // Status loading untuk menampilkan indikator loading
  final isLoading = false.obs;

  final isNewPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  // Membersihkan controller saat widget dihapus
  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Validasi input password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  // Validasi input konfirmasi password
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi password tidak boleh kosong';
    }
    // Memastikan password dan konfirmasi password sama
    if (value != passwordController.text) {
      return 'Password tidak cocok';
    }
    return null;
  }

  // Fungsi untuk melakukan reset password
  Future<void> resetPassword() async {
    // Cek apakah form valid
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      // Set status loading menjadi true
      isLoading.value = true;

      // Mengambil token dari parameter route
      // final token = Get.parameters['token'];

      // Menampilkan notifikasi sukses
      Get.snackbar(
        'Sukses',
        'Password berhasil direset',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigasi ke halaman login setelah berhasil reset password
      Get.offAllNamed('/login');
    } catch (e) {
      // Menampilkan notifikasi error jika terjadi kesalahan
      Get.snackbar(
        'Error',
        'Gagal mereset password: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      // Set status loading menjadi false setelah proses selesai
      isLoading.value = false;
    }
  }
}
