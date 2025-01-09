import 'dart:async';
import 'package:get/get.dart';
import 'package:my_pantry/app/data/models/category/categories_model.dart';
import 'package:my_pantry/app/data/models/expired_category.dart';
import 'package:my_pantry/app/data/repositories/category_repositories.dart';
import 'widgets/notification_services.dart';

// Controller untuk menangani notifikasi menggunakan GetX
class NotificationController extends GetxController {
  // Variable untuk menandai status loading
  final isLoading = false.obs;
  // List untuk menyimpan item yang kadaluarsa
  final expiredItems = <ExpiredCategory>[].obs;

  // Inisialisasi controller
  @override
  void onInit() {
    super.onInit();
    // Cek item kadaluarsa saat pertama kali
    checkExpiredItems();
    // Mulai pengecekan berkala
    startPeriodicCheck();
  }

  // Method untuk memeriksa item yang kadaluarsa
  Future<void> checkExpiredItems() async {
    try {
      isLoading.value = true;
      // Inisialisasi repository
      final categoryRepo = CategoryRepository();
      // Ambil semua kategori
      final categories = await categoryRepo.getCategory();

      // Dapatkan tanggal sekarang dan 5 hari ke depan
      final now = DateTime.now();
      final warningDate = now.add(const Duration(days: 5));
      expiredItems.clear();

      // Loop setiap kategori
      for (var category in categories) {
        int expiredCount = 0;
        final expiredStorages = <Storage>[];

        // Cek setiap storage dalam kategori
        for (var storage in category.storages) {
          // Jika tanggal kadaluwarsa kurang dari 5 hari
          if (storage.expiryDate!.isBefore(warningDate)) {
            expiredCount++;
            expiredStorages.add(storage);
          }
        }

        // Jika ada item yang akan kadaluwarsa
        if (expiredCount > 0) {
          // Tambahkan ke list expired items
          expiredItems.add(ExpiredCategory(
            expiredCount: expiredCount,
            categoryName: category.nameCategory,
            data: expiredStorages,
            imageUrl: category.picture,
          ));

          // Kirim notifikasi
          sendNotification(
            'Peringatan Stok: ${category.nameCategory}',
            'Anda memiliki $expiredCount item yang akan kadaluwarsa dalam 5 hari ke depan di kategori ini.',
          );
        }
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Method untuk refresh data item kadaluwarsa
  Future<void> onRefreshExpiredItems() async {
    try {
      isLoading.value = true;
      expiredItems.clear();
      checkExpiredItems();
    } finally {
      isLoading.value = false;
    }
  }

  // Method untuk mengirim notifikasi
  void sendNotification(String title, String body) {
    NotificationService.showNotification(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title: title,
      body: body,
    );
  }

  // Method untuk memulai pengecekan berkala
  void startPeriodicCheck() {
    // Cek setiap 1 jam
    Timer.periodic(const Duration(hours: 1), (timer) {
      checkExpiredItems();
    });
  }
}
