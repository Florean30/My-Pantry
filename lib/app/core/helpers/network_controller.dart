import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller untuk menangani status koneksi jaringan menggunakan GetX
class NetworkController extends GetxController {
  // Inisialisasi instance Connectivity untuk memonitor status jaringan
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    // Mendengarkan perubahan status koneksi jaringan
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Method untuk memperbarui status koneksi dan menampilkan snackbar
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    // Jika tidak ada koneksi internet
    if (connectivityResult == ConnectivityResult.none) {
      // Menampilkan snackbar peringatan tidak ada koneksi
      Get.rawSnackbar(
          // Teks pesan yang ditampilkan
          messageText: const Text('Tidak ada koneksi',
              style: TextStyle(color: Colors.white, fontSize: 14)),
          // Snackbar tidak bisa ditutup manual
          isDismissible: false,
          // Durasi snackbar (1 hari atau sampai koneksi kembali)
          duration: const Duration(days: 1),
          // Warna latar belakang snackbar
          backgroundColor: Colors.red[400]!,
          // Ikon untuk snackbar
          icon: const Icon(
            Icons.signal_wifi_connected_no_internet_4_sharp,
            color: Colors.white,
            size: 20,
          ),
          // Margin snackbar
          margin: EdgeInsets.zero,
          // Style snackbar yang menempel di bawah layar
          snackStyle: SnackStyle.GROUNDED);
    } else {
      // Jika ada koneksi internet dan snackbar sedang terbuka
      if (Get.isSnackbarOpen) {
        // Tutup snackbar yang sedang ditampilkan
        Get.closeCurrentSnackbar();
      }
    }
  }
}
