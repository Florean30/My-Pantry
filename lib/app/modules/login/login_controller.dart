import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  // Text editing controllers untuk form fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observable untuk status password visibility
  final RxBool isPasswordVisible = false.obs;

  // Observable untuk status loading
  final RxBool isLoading = false.obs;

  // Method untuk toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Method untuk handle login
  Future<void> login() async {
    if (!_validateInputs()) return;

    try {
      isLoading.value = true;

      // Jika berhasil login
      Get.offNamed('/home');
    } catch (e) {
      // Handle error
      Get.snackbar(
        'Error',
        'Gagal login: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Validasi input
  bool _validateInputs() {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Email tidak boleh kosong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar(
        'Error',
        'Format email tidak valid',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Password tidak boleh kosong',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    return true;
  }

  @override
  void onClose() {
    // Bersihkan controllers ketika widget di dispose
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
