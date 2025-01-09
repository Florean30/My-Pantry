import 'package:get/get.dart';
import 'package:my_pantry/app/data/models/category/categories_model.dart';
import 'package:my_pantry/app/data/repositories/category_repositories.dart';

// Controller untuk halaman Home yang menggunakan GetX
class HomeController extends GetxController {
  // List observable untuk menyimpan data kategori
  final categories = <CategoriesModel>[].obs;
  // Variable observable untuk status loading
  final isLoading = false.obs;

  // Method yang dipanggil saat controller diinisialisasi
  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  // Method untuk mengambil data kategori dari repository
  Future<void> getCategory() async {
    isLoading.value = true; // Set loading menjadi true
    final category = await CategoryRepository().getCategory();
    categories.value = category; // Update nilai categories
    isLoading.value = false; // Set loading menjadi false
  }

  // Method untuk refresh data kategori
  Future<void> onRefresh() async {
    categories.clear(); // Hapus data kategori yang ada
    await getCategory(); // Ambil data kategori baru
  }
}
