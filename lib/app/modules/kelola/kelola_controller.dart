import 'package:get/get.dart';
import 'package:mypantry_app/app/data/models/kelola/aktivitas_kelola.dart';
import 'package:mypantry_app/app/data/models/kelola/penyimpanan_kelola.dart';
import 'package:mypantry_app/app/data/models/kelola/jumlah_kelola.dart';

class KelolaController extends GetxController {
  // State untuk menyimpan nilai yang dipilih
  final selectedActivity = Rx<Activity?>(null);
  final selectedActivityDate = Rx<DateTime?>(null);
  final selectedExpiryDate = Rx<DateTime?>(null);
  final selectedQuantity = Rx<Quantity?>(null);
  final selectedStorage = Rx<Storage?>(null);

  // Method untuk memproses data kelola
  void submitKelola() {
    if (validateInput()) {
      // Implementasi logika penyimpanan data
      try {
        // Proses penyimpanan data ke database atau API
        Get.snackbar(
          'Sukses',
          'Data berhasil disimpan',
          snackPosition: SnackPosition.BOTTOM,
        );
        clearForm();
      } catch (e) {
        Get.snackbar(
          'Error',
          'Terjadi kesalahan saat menyimpan data',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  // Validasi input
  bool validateInput() {
    if (selectedActivity.value == null ||
        selectedActivityDate.value == null ||
        selectedExpiryDate.value == null ||
        selectedQuantity.value == null ||
        selectedStorage.value == null) {
      Get.snackbar(
        'Error',
        'Mohon lengkapi semua field',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;
  }

  // Reset form
  void clearForm() {
    selectedActivity.value = null;
    selectedActivityDate.value = null;
    selectedExpiryDate.value = null;
    selectedQuantity.value = null;
    selectedStorage.value = null;
  }
}