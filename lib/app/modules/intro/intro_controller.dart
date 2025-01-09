// ignore_for_file: unnecessary_overrides
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_pantry/app/routes/home_routes.dart';
import 'package:my_pantry/app/routes/login_routes.dart';
import 'package:my_pantry/main.dart';

// Controller untuk mengatur logika halaman intro/splash-screen
class IntroController extends GetxController {
  // Variabel untuk menyimpan token autentikasi
  String? obtainedToken;
  // Variabel untuk menyimpan email yang tersimpan
  String? savedEmail;
  // Inisialisasi GetStorage untuk menyimpan data lokal
  final box = GetStorage();

  @override
  void onInit() async {
    // Menambah delay 1 detik sebelum pengecekan
    await Future.delayed(const Duration(seconds: 1));
    // Melakukan validasi data yang tersimpan
    getValidationData().whenComplete(() async {
      // Jika ada email yang tersimpan
      if (savedEmail != null) {
        // Memuat data pengguna
        await user.loadUserData();
        log("User: ${user.currentUser?.email}");
        // Navigasi ke halaman home
        Get.offNamed(HomeRoutes.home);
      } else {
        // Jika tidak ada email tersimpan, navigasi ke halaman login
        Get.offNamed(LoginRoutes.login);
      }
    });
    super.onInit();
  }

  // Fungsi untuk mendapatkan data validasi dari penyimpanan lokal
  Future<void> getValidationData() async {
    // Mengambil token dari penyimpanan
    var obtainedToken = box.read("TOKEN");
    // Menyimpan token ke dalam savedEmail
    savedEmail = obtainedToken;
    log("Token: $savedEmail");
  }

  @override
  void onClose() {
    super.onClose();
  }
}
