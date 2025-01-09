import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Widget untuk menampilkan berbagai jenis snackbar kustom
class CustomSnackBar {
  // Menampilkan snackbar sukses dengan warna hijau sebagai default
  static showCustomToastSuccess({
    String? title,
    required String message,
    Color? color,
    bool? isDismissible,
    Duration? duration,
    SnackPosition? position,
  }) {
    Get.closeAllSnackbars(); // Menutup semua snackbar yang sedang terbuka
    Get.rawSnackbar(
        snackPosition:
            position ?? SnackPosition.BOTTOM, // Posisi default di bawah
        title: title,
        duration:
            duration ?? const Duration(seconds: 2), // Durasi default 2 detik
        snackStyle: SnackStyle.GROUNDED, // Style menempel pada bagian bawah
        backgroundColor: color ?? Colors.green, // Warna latar default hijau
        onTap: (snack) {
          Get.closeAllSnackbars(); // Menutup snackbar saat diklik
        },
        //overlayBlur: 0.8,
        message: message,
        isDismissible: isDismissible ?? true // Bisa ditutup secara default
        );
  }

  // Menampilkan snackbar error dengan warna merah sebagai default
  static showCustomToastError({
    String? title,
    String? message,
    bool? isDismissible,
    Color? color,
    Duration? duration,
    SnackPosition? position,
  }) {
    Get.closeAllSnackbars(); // Menutup semua snackbar yang sedang terbuka
    Get.rawSnackbar(
        snackPosition:
            position ?? SnackPosition.BOTTOM, // Posisi default di bawah
        duration: duration ??
            const Duration(milliseconds: 1500), // Durasi default 1.5 detik
        snackStyle: SnackStyle.FLOATING, // Style mengambang
        backgroundColor: color ??
            const Color.fromARGB(242, 225, 31, 18), // Warna latar default merah
        onTap: (snack) {
          Get.closeAllSnackbars(); // Menutup snackbar saat diklik
        },
        message: message ??
            "masih dalam pengembangan", // Pesan default jika tidak ada pesan
        isDismissible: isDismissible ?? true // Bisa ditutup secara default
        );
  }

  // Menampilkan snackbar material design standar
  static void showMaterialSnackbar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3), // Durasi default 3 detik
    SnackBarAction? action,
    Color backgroundColor =
        Colors.black87, // Warna latar default hitam transparan
    Color textColor = Colors.white, // Warna teks default putih
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      duration: duration,
      backgroundColor: backgroundColor,
      action: action,
    );

    // Menampilkan snackbar menggunakan ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
