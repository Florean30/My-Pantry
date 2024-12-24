import 'package:get/get.dart';

// Controller untuk menangani logika lupa password
class ForgotController extends GetxController {
  // Observable untuk status loading
  final isLoading = false.obs;

  // Observable untuk menyimpan email
  final email = ''.obs;

  // Method untuk memvalidasi format email menggunakan GetUtils
  bool isValidEmail(String email) {
    return GetUtils.isEmail(email);
  }

  // Method untuk memproses permintaan lupa password
  Future<void> handleForgotPassword() async {
    // Validasi jika email kosong
    if (email.isEmpty) {
      Get.snackbar(
        'Error',
        'Email tidak boleh kosong',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Validasi format email
    if (!isValidEmail(email.value)) {
      Get.snackbar(
        'Error',
        'Email tidak valid',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      // Set status loading menjadi true
      isLoading.value = true;

      // Tampilkan pesan sukses
      Get.snackbar(
        'Sukses',
        'Link reset password telah dikirim ke email Anda',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Tangani error jika terjadi kesalahan
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
      // Selalu jalankan kode ini di akhir proses
    } finally {
      // Set status loading menjadi false
      isLoading.value = false;
    }
  }

  // Method untuk mengupdate nilai email dari input user
  void updateEmail(String value) {
    email.value = value;
  }
}
