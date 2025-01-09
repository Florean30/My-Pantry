// ignore_for_file: unnecessary_overrides
import 'dart:developer';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/widgets/custom_snackbar.dart';
import 'package:my_pantry/app/data/models/expired_category.dart';
import 'package:my_pantry/app/data/repositories/storage_repositories.dart';
import 'package:my_pantry/app/modules/notification/notification_controller.dart';

// Controller untuk menangani logika halaman detail notifikasi
class DetailnotifController extends GetxController {
  // Menyimpan data item yang kadaluarsa dari argument
  ExpiredCategory expiredItem = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    // Menampilkan data item dalam format JSON di log
    log(expiredItem.toJson().toString());
  }

  // Fungsi untuk menghapus item berdasarkan ID
  Future<void> onDeleteStorageById(int index) async {
    // Memanggil repository untuk menghapus data storage
    await StorageRepositories()
        .deleteStorageById(storageId: expiredItem.data[index].id);
    // Kembali ke halaman sebelumnya
    Get.back();
    // Menampilkan snackbar sukses
    CustomSnackBar.showCustomToastSuccess(
      position: SnackPosition.TOP,
      message: "Berhasil menghapus data",
    );
    // Memperbarui daftar item kadaluarsa di halaman notifikasi
    Get.find<NotificationController>().onRefreshExpiredItems();
  }

  @override
  void onClose() {
    // Dipanggil ketika controller dihapus
    super.onClose();
  }
}
