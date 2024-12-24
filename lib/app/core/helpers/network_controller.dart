import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// Controller untuk menangani status koneksi jaringan
class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    // Mendengarkan perubahan status koneksi
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus as void
        Function(List<ConnectivityResult> event)?);
  }

  // Fungsi untuk memperbarui dan menampilkan status koneksi
  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    // Jika tidak ada koneksi internet
    if (connectivityResult == ConnectivityResult.none) {
      // Menampilkan snackbar peringatan tidak ada koneksi
      Get.rawSnackbar(
          messageText: const Text('Tidak ada koneksi',
              style: TextStyle(color: Colors.white, fontSize: 14)),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon: const Icon(
            Icons.signal_wifi_connected_no_internet_4_sharp,
            color: Colors.white,
            size: 20,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      // Jika koneksi tersedia, tutup snackbar jika sedang terbuka
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
