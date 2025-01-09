import 'package:get/get.dart';
import 'package:my_pantry/app/data/models/category/categories_model.dart';
import 'package:my_pantry/app/data/repositories/category_repositories.dart';
import 'package:my_pantry/app/modules/home/home_controller.dart';

// Controller untuk mengelola daftar kategori
class ListkategoriController extends GetxController {
  // ID kategori yang diterima dari argumen
  int? categoryId = Get.arguments;
  // Model kategori yang dapat diobservasi
  final category = Rxn<CategoriesModel>();
  // Status loading yang dapat diobservasi
  final isLoading = false.obs;

  // Inisialisasi controller
  @override
  void onInit() {
    super.onInit();
    getCategoryById();
  }

  // Mengambil data kategori berdasarkan ID
  Future<CategoriesModel?> getCategoryById() async {
    isLoading.value = true;
    category.value =
        await CategoryRepository().getCategoryById(categoryId: categoryId);
    isLoading.value = false;

    return category.value;
  }

  // Mendapatkan jumlah storage dalam kategori
  int getStoragesLength() {
    if (category.value != null) {
      return category.value!.storages.length;
    }
    return 0;
  }

  // Memperbarui data dengan menghapus storage yang ada dan mengambil ulang data
  Future<void> onRefresh() async {
    category.value!.storages.clear();
    await getCategoryById();
  }

  // Dipanggil saat controller dihapus
  @override
  void onClose() {
    // Memperbarui data di HomeController
    Get.find<HomeController>().onRefresh();
    super.onClose();
  }
}
