import 'package:get/get.dart';

class ForgotController extends GetxController {
  final isLoading = false.obs;
  
  // Observable untuk menyimpan email
  final email = ''.obs;

  // Method untuk memvalidasi email
  bool isValidEmail(String email) {
    return GetUtils.isEmail(email);
  }

  // Method untuk menangani proses forgot password
  Future<void> handleForgotPassword() async {
    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Email tidak boleh kosong',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (!isValidEmail(email.value)) {
      Get.snackbar(
        'Error',
        'Email tidak valid',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;
      
      // Di sini Anda bisa menambahkan logika untuk mengirim email reset password
      // Contoh:
      // await authService.sendPasswordResetEmail(email.value);
      
      Get.snackbar(
        'Sukses',
        'Link reset password telah dikirim ke email Anda',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Opsional: navigasi ke halaman lain setelah sukses
      // Get.toNamed('/otp');
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Method untuk mengupdate nilai email
  void updateEmail(String value) {
    email.value = value;
  }
}