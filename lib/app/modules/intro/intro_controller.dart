import 'package:get/get.dart';
import 'package:mypantry_app/app/routes/login_routes.dart';

// Controller untuk halaman intro/splash-screen
class IntroController extends GetxController {
  @override
  // Method yang dipanggil saat controller diinisialisasi
  void onInit() async {
    super.onInit();
    // Menunda eksekusi selama 1 detik untuk menampilkan splash-screen
    await Future.delayed(const Duration(seconds: 1));
    // Navigasi ke halaman login dan menghapus halaman sebelumnya dari stack
    Get.offNamed(LoginRoutes.login);
  }

  @override
  // Method yang dipanggil saat controller dihapus
  void onClose() {
    super.onClose();
  }
}