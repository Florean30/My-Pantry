import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/widgets/custom_snackbar.dart';
import 'package:my_pantry/app/data/models/kelola/penyimpanan_kelola.dart';
import 'package:my_pantry/app/data/models/storage/storages_model.dart';
import 'package:my_pantry/app/data/repositories/storage_repositories.dart';
import 'package:my_pantry/app/modules/listkategori/listkategori_controller.dart';

class KelolaController extends GetxController {
  // Model penyimpanan
  final storage = Rxn<StoragesModel>();

  // Controller untuk input field
  final nameController = TextEditingController();
  final activityController = TextEditingController();
  final activityDateController = TextEditingController();
  final expiryDateController = TextEditingController();
  final quantityController = TextEditingController();
  final storageController = TextEditingController();
  final unitController = TextEditingController();
  final categoryController = TextEditingController();
  final selectedStorage = Rx<StorageEnum?>(null);

  // Variable untuk jumlah dan status loading
  final quantity = 0.obs;
  final isLoading = false.obs;

  // Menerima argument dari halaman sebelumnya
  List? args = Get.arguments;

  // Cek apakah dalam mode edit
  bool get isEditMode => args?.length == 3;

  @override
  void onInit() async {
    log(args.toString());
    super.onInit();
    Get.put(() => ListkategoriController());
    unitController.text = 'Pcs';
    if (isEditMode) {
      await getStorageById();
      log(storage.toJson().toString());
      nameController.text = storage.value?.name ?? '';
      activityController.text = storage.value?.activity ?? '';

      // Ubah format tampilan tanggal
      activityDateController.text = storage.value?.activityDate != null
          ? _formatDate(storage.value!.activityDate!)
          : '';
      expiryDateController.text = storage.value?.expiryDate != null
          ? _formatDate(storage.value!.expiryDate!)
          : '';

      quantityController.text = storage.value?.quantity.toString() ?? '';
      quantity.value = storage.value?.quantity ?? 0;
      storageController.text = storage.value?.storageLocation ?? '';
    }
  }

  // Helper method untuk memformat tanggal ke dd/mm/yyyy
  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  // Mengambil data storage berdasarkan ID
  Future<void> getStorageById() async {
    isLoading.value = true;
    storage.value = await StorageRepositories().getStorageById(
      storageId: args?[0],
    );
    isLoading.value = false;
    selectedStorage.value;
  }

  // Method untuk menyimpan atau mengupdate data
  Future<void> onSavePressed() async {
    if (isEditMode) {
      await updateStorage();
      Get.back();
      CustomSnackBar.showCustomToastSuccess(
        position: SnackPosition.TOP,
        message: "Berhasil mengubah data",
      );
      Get.find<ListkategoriController>().onRefresh();
    } else {
      if (nameController.text.isEmpty ||
          activityController.text.isEmpty ||
          activityDateController.text.isEmpty ||
          expiryDateController.text.isEmpty ||
          quantityController.text.isEmpty ||
          storageController.text.isEmpty) {
        CustomSnackBar.showCustomToastError(
          message: "Harap isi semua field",
        );
        return;
      } else {
        await createStorage();
        Get.back();
        CustomSnackBar.showCustomToastSuccess(
          position: SnackPosition.TOP,
          message: "Berhasil menambahkan data",
        );
        Get.find<ListkategoriController>().onRefresh();
      }
    }
  }

  // Method untuk membuat storage baru
  Future<void> createStorage() async {
    isLoading.value = true;

    // Konversi format dd/mm/yy ke DateTime
    final activityDate =
        _parseDate(activityDateController.text)?.toIso8601String();
    final expiryDate = _parseDate(expiryDateController.text)?.toIso8601String();

    await StorageRepositories().createStorage(
      name: nameController.text,
      activity: activityController.text,
      activityDate: activityDate!,
      expiryDate: expiryDate!,
      quantity: int.parse(quantityController.text),
      storageLocation: storageController.text,
      categoryId: args?[0],
    );
    isLoading.value = false;
  }

  // Method untuk mengupdate storage yang ada
  Future<void> updateStorage() async {
    isLoading.value = true;

    // Konversi format dd/mm/yy ke DateTime
    final activityDate =
        _parseDate(activityDateController.text)?.toIso8601String();
    final expiryDate = _parseDate(expiryDateController.text)?.toIso8601String();

    await StorageRepositories().updateStorage(
      storageId: args?[0],
      name: nameController.text,
      activity: activityController.text,
      activityDate: activityDate!,
      expiryDate: expiryDate!,
      quantity: quantity.value,
      storageLocation: storageController.text,
    );
    isLoading.value = false;
  }

  // Method untuk menambah quantity
  void incrementQuantity() {
    quantity.value++;
  }

  // Method untuk mengurangi quantity
  void decrementQuantity() {
    quantity.value--;
  }

  // Method untuk menghapus storage berdasarkan ID
  Future<void> onDeleteStorageById() async {
    await StorageRepositories().deleteStorageById(storageId: args?[0]);
    Get.back();
    CustomSnackBar.showCustomToastSuccess(
      position: SnackPosition.TOP,
      message: "Berhasil menghapus data",
    );
    Get.find<ListkategoriController>().onRefresh();
  }

  @override
  void onClose() {
    unitController.dispose();
    nameController.dispose();
    activityController.dispose();
    activityDateController.dispose();
    expiryDateController.dispose();
    quantityController.dispose();
    storageController.dispose();

    super.onClose();
  }

  // Helper method untuk parsing tanggal dari format dd/mm/yyyy ke DateTime
  DateTime? _parseDate(String date) {
    try {
      List<String> parts = date.split('/');
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);

      // Tambahkan waktu spesifik dan zona waktu lokal
      return DateTime(year, month, day, 12, 0, 0).toLocal();
    } catch (e) {
      return null;
    }
  }
}
