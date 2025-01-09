import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/widgets/custom_snackbar.dart';
import 'package:my_pantry/app/data/repositories/profile_repositories.dart';
import 'package:my_pantry/app/modules/profile/profile_controller.dart';
import 'package:my_pantry/main.dart';

// Controller untuk halaman edit profile
class EditProfileController extends GetxController {
  // Key untuk form validation
  final formKey = GlobalKey<FormState>();

  // Controller untuk input field
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();

  // Status loading untuk menampilkan indikator loading
  final isLoading = false.obs;

  // Observable untuk mengatur visibility password
  final isPasswordVisible = true.obs;
  final isNewPasswordVisible = true.obs;

  // Dipanggil saat controller diinisialisasi
  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  // Method untuk memuat data user dari storage
  Future<void> loadUserData() async {
    await user.loadUserData();
    nameController.text = user.currentUser?.namaLengkap ?? '';
    emailController.text = user.currentUser?.email ?? '';
  }

  // Method untuk mengupdate profile pengguna
  Future<void> updateProfile() async {
    // Validasi form sebelum melakukan update
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      // Memanggil repository untuk update profile
      final result = await ProfileRepository().editProfile(
        name: nameController.text,
        email: emailController.text,
        password: newPasswordController.text,
      );

      // Menampilkan pesan sukses/error sesuai hasil update
      if (result == true) {
        Get.back();
        CustomSnackBar.showCustomToastSuccess(
          message: "Berhasil update profile",
        );
      } else {
        CustomSnackBar.showCustomToastError(
          message: "Gagal update profile",
        );
      }
      isLoading.value = false;
    }
  }

  // Dipanggil saat controller dihapus
  @override
  void onClose() {
    // Membersihkan controller untuk mencegah memory leak
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    newPasswordController.dispose();

    // Memuat ulang data profile setelah update
    Get.find<ProfileController>().loadUserData();
    super.onClose();
  }
}
