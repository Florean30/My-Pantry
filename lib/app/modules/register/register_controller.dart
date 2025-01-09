import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_pantry/app/core/widgets/custom_snackbar.dart';
import 'package:my_pantry/app/data/repositories/auth_repositories.dart';

// Controller untuk halaman registrasi
class RegisterController extends GetxController {
  // Key untuk form validation
  final formKey = GlobalKey<FormState>();

  final box = GetStorage();
  final isLoading = false.obs;

  // Controller untuk input field
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  // Observable boolean untuk toggle visibility password
  final isPasswordVisible = true.obs;
  final isRepeatPasswordVisible = true.obs;

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final authRepository = AuthRepository();
      final response = await authRepository.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      if (response) {
        Get.back();
        CustomSnackBar.showCustomToastSuccess(
          message: "Berhasil register",
        );
        isLoading.value = false;
      } else {
        CustomSnackBar.showCustomToastError(
          message: box.read("errMsg"),
        );
        isLoading.value = false;
      }
    }
    isLoading.value = false;
  }

  // Membersihkan controller saat widget dihapus
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.onClose();
  }
}
