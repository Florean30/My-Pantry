import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/data/repositories/auth_repositories.dart';
import 'package:my_pantry/app/routes/intro_routes.dart';
import 'package:my_pantry/main.dart';

class ProfileController extends GetxController {
  // Form key untuk validasi
  final formKey = GlobalKey<FormState>();

  // Text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    // Inisialisasi data awal jika ada
  }

  @override
  void onClose() {
    // Dispose controllers untuk mencegah memory leak
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }

  Future<void> loadUserData() async {
    await user.loadUserData();
    nameController.text = user.currentUser?.namaLengkap ?? '';
    emailController.text = user.currentUser?.email ?? '';
  }

  // Fungsi untuk logout
  Future<void> logout() async {
    await AuthRepository().logout();
    Get.offAllNamed(IntroRoutes.intro);
  }
}
