import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/widgets/custom_snackbar.dart';
import 'package:my_pantry/app/data/models/storage/storages_model.dart';
import 'package:my_pantry/app/data/repositories/storage_repositories.dart';
import 'package:my_pantry/app/modules/activity_history/widgets/pdf_generate_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

// Controller untuk mengelola riwayat aktivitas
class ActivityHistoryController extends GetxController {
  // List observable untuk menyimpan aktivitas
  final activities = <StoragesModel>[].obs;
  // Service untuk generate PDF
  final pdfService = PdfGenerateService();
  // Status loading observable
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Mengambil data aktivitas saat controller diinisialisasi
    getActivities();
  }

  // Mengambil data aktivitas dari repository
  Future<void> getActivities() async {
    isLoading.value = true;
    activities.value = await StorageRepositories().getAllStorages();
    isLoading.value = false;
  }

  // Fungsi untuk menghasilkan dan mengunduh PDF
  Future<void> generateDownloadPDF() async {
    try {
      // Cek izin penyimpanan untuk Android
      if (Platform.isAndroid) {
        final status = await Permission.manageExternalStorage.status;
        if (status.isDenied) {
          final result = await Permission.manageExternalStorage.request();
          if (!result.isGranted) {
            CustomSnackBar.showCustomToastError(
              message: "Izin penyimpanan diperlukan",
            );
            return;
          }
        }
      }

      // Membuat dokumen PDF baru
      final PdfDocument document = PdfDocument();
      final PdfPage page = document.pages.add();
      final Size pageSize = page.getClientSize();

      // Membuat dan mengatur grid PDF
      final PdfGrid grid = pdfService.getGrid(activities);
      final PdfLayoutResult result =
          pdfService.drawHeader(page, pageSize, grid);
      pdfService.drawGrid(page, grid, result);
      pdfService.drawFooter(page, pageSize);

      // Menyimpan dan membuka file PDF
      final List<int> bytes = document.saveSync();
      document.dispose();
      await pdfService.saveAndLaunchFile(bytes, 'Aktivitas.pdf');
    } catch (e) {
      log('Error generating PDF: $e');
      CustomSnackBar.showCustomToastError(
        message: "Gagal menghasilkan PDF: $e",
      );
    }
  }

  // Fungsi untuk refresh data aktivitas
  Future<void> onRefresh() async {
    activities.clear();
    await getActivities();
  }
}
