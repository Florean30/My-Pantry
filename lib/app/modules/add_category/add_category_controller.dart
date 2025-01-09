import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/widgets/custom_snackbar.dart';
import 'package:my_pantry/app/data/repositories/category_repositories.dart';
import 'package:my_pantry/app/modules/home/home_controller.dart';

// Controller untuk menangani penambahan kategori
class AddCategoryController extends GetxController {
  // Controller untuk input field nama dan gambar
  final nameController = TextEditingController();
  final imageController = TextEditingController();
  // Variable untuk menangani status loading
  final isLoading = false.obs;
  // Key untuk form validation
  final formKey = GlobalKey<FormState>();

  // Fungsi untuk menambahkan kategori baru
  Future<bool> addCategory() async {
    isLoading.value = true;

    // Validasi form sebelum menambahkan kategori
    if (formKey.currentState!.validate()) {
      // Memanggil repository untuk membuat kategori baru
      final response = await CategoryRepository().createCategory(
        nameCategory: nameController.text,
        pictureURL: imageController.text,
      );

      // Handling response dari repository
      if (response) {
        Get.back(); // Kembali ke halaman sebelumnya
        // Menampilkan pesan sukses
        CustomSnackBar.showCustomToastSuccess(
            message: "Kategori berhasil ditambahkan");
        isLoading.value = false;
      } else {
        // Menampilkan pesan error
        CustomSnackBar.showCustomToastError(
            message: "Kategori gagal ditambahkan");
        isLoading.value = false;
      }
      return response;
    }

    isLoading.value = false;
    return false;
  }

  // Fungsi yang dipanggil ketika controller dihapus
  @override
  void onClose() {
    // Membersihkan controller
    nameController.dispose();
    imageController.dispose();
    // Merefresh halaman home
    Get.find<HomeController>().onRefresh();

    super.onClose();
  }
}
