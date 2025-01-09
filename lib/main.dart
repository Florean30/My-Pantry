import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_pantry/app/core/helpers/network_controller.dart';
import 'package:my_pantry/app/core/theme/app_theme.dart';
import 'package:my_pantry/app/data/repositories/profile_repositories.dart';
import 'package:my_pantry/app/modules/notification/widgets/notification_services.dart';
import 'package:my_pantry/app/routes/app_pages.dart';

// Fungsi main yang dijalankan pertama kali saat aplikasi dimulai
Future<void> main() async {
  // Menginisialisasi Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Menginisialisasi NetworkController dengan GetX dan menjadikannya permanent
  Get.put<NetworkController>(NetworkController(), permanent: true);
  // Menginisialisasi GetStorage untuk penyimpanan lokal
  GetStorage.init();
  // Menginisialisasi layanan notifikasi
  await NotificationService.initialize();
  // Menjalankan aplikasi Flutter
  runApp(const MyApp());
}

// Membuat instance user dari UserManager
final user = UserManager.instance;

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Menghilangkan banner debug di pojok kanan atas
      debugShowCheckedModeBanner: false,
      // Mengatur tema aplikasi
      theme: myTheme,
      // Mengatur rute awal aplikasi
      initialRoute: AppPages.initial,
      // Mendefinisikan semua rute dalam aplikasi
      getPages: AppPages.routes,
    );
  }
}
