import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isLoading = false.obs;
 

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi password tidak boleh kosong';
    }
    if (value != passwordController.text) {
      return 'Password tidak cocok';
    }
    return null;
  }

  Future<void> resetPassword() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;
      
      // Asumsikan kita mendapatkan token dari parameter route
      final token = Get.parameters['token'];
      
      // await _authService.resetPassword(
      //   token: token ?? '',
      //   newPassword: passwordController.text,
      // );

      Get.snackbar(
        'Sukses',
        'Password berhasil direset',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Kembali ke halaman login
      Get.offAllNamed('/login');
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mereset password: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
