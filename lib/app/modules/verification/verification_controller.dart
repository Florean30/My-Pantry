import 'package:get/get.dart';

class VerificationController extends GetxController {
  // Variable untuk menyimpan kode verifikasi
  final verificationCode = ''.obs;

  // Variable untuk timer countdown (dalam detik)
  final remainingTime = 60.obs;

  // Variable untuk mengontrol status pengiriman ulang
  final canResend = false.obs;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  // Fungsi untuk memulai timer countdown
  void startTimer() {
    remainingTime.value = 60;
    canResend.value = false;

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      remainingTime.value--;

      if (remainingTime.value <= 0) {
        canResend.value = true;
        return false;
      }
      return true;
    });
  }

  // Fungsi untuk memperbarui kode verifikasi
  void updateVerificationCode(String code) {
    verificationCode.value = code;
  }

  // Fungsi untuk mengirim ulang kode
  void resendCode() {
    if (canResend.value) {
      // Implementasi logika pengiriman ulang kode
      // Misalnya memanggil API untuk mengirim ulang kode

      // Restart timer setelah mengirim ulang
      startTimer();
    }
  }

  // Fungsi untuk memverifikasi kode
  Future<void> verifyCode() async {
    if (verificationCode.value.length != 6) {
      Get.snackbar(
        'Error',
        'Silakan masukkan 6 digit kode verifikasi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      // Implementasi logika verifikasi kode
      // Misalnya memanggil API untuk memverifikasi kode

      // Jika berhasil, navigasi ke halaman berikutnya
      Get.offNamed('/success');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan saat memverifikasi kode',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
