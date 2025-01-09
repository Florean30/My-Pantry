import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_pantry/app/core/widgets/custom_snackbar.dart';
import 'package:my_pantry/app/data/repositories/auth_repositories.dart';
import 'package:my_pantry/app/routes/home_routes.dart';

class LoginController extends GetxController {
  // Text editing controllers untuk form fields
  final box = GetStorage();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observable untuk status password visibility
  final isPasswordVisible = false.obs;

  // Observable untuk status loading
  final isLoading = false.obs;

  // Method untuk toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Method untuk handle login
  Future<void> login() async {
    isLoading.value = true;
    final authRepository = AuthRepository();
    final response = await authRepository.login(
      email: emailController.text,
      password: passwordController.text,
    );

    if (response == true) {
      CustomSnackBar.showCustomToastSuccess(
        message: 'Berhasil login',
        color: Colors.green[700],
      );

      await Get.offNamed(HomeRoutes.home);
      isLoading.value = false;
    } else {
      CustomSnackBar.showCustomToastError(
        message: box.read("errMsg"),
      );
      isLoading.value = false;
    }
    isLoading.value = false;
  }
}
