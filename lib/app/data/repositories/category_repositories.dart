import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_pantry/app/core/services/api_endpoint.dart';
import 'package:my_pantry/app/core/services/network_services.dart';
import 'package:my_pantry/app/data/models/category/categories_model.dart';

// repository untuk mengelola operasi kategori
class CategoryRepository {
  // Inisialisasi GetStorage untuk menyimpan data
  final box = GetStorage();

  // Method untuk mendapatkan semua kategori
  Future<List<CategoriesModel>> getCategory() async {
    try {
      // Membuat request GET ke endpoint kategori
      final request = ApiRequest();
      var response = await request.get(categoryUrl);
      JSON obj = response.data;

      // Jika status code 200, maka ambil data kategori dan kembalikan
      if (response.statusCode == 200) {
        final data = obj['data'] as List;
        final categories =
            data.map((e) => CategoriesModel.fromJson(e)).toList();
        return categories;
      }
      // Jika status code bukan 200, maka kembalikan list kosong
      return [];
    } on DioException catch (e) {
      // Jika terjadi error, maka ambil pesan error dan simpan ke GetStorage
      final errorRes = e.response;
      String message = errorRes?.data['error']; // ambil pesan error
      box.write("errMsg", message);
      log(message);
      rethrow;
    }
  }

  // Method untuk mendapatkan kategori berdasarkan ID
  Future<CategoriesModel> getCategoryById({int? categoryId}) async {
    try {
      // Membuat request GET ke endpoint kategori berdasarkan ID
      final request = ApiRequest();
      var response = await request.get("$categoryUrl/$categoryId");
      JSON obj = response.data;

      // Inisialisasi kategori dengan null
      CategoriesModel? category;

      if (response.statusCode == 200) {
        category = CategoriesModel.fromJson(obj['data']);

        return category;
      }
      // Jika status code bukan 200, maka kembalikan kategori yang sudah ada
      return category!;
    } on DioException catch (e) {
      // Jika terjadi error, maka ambil pesan error dan simpan ke GetStorage
      final errorRes = e.response;
      String message = errorRes?.data['error']; // ambil pesan error
      box.write("errMsg", message);
      log(message);
      rethrow;
    }
  }

  // Method untuk membuat kategori baru
  Future<bool> createCategory({
    required String nameCategory,
    required String pictureURL,
  }) async {
    try {
      // Membuat request POST ke endpoint kategori
      final request = ApiRequest();
      var response = await request.post(
        categoryUrl,
        data: {"name_category": nameCategory, "picture": pictureURL},
      );

      // Jika status code 201, maka kembalikan true
      if (response.statusCode == 201) {
        return true;
      }
      // Jika status code bukan 201, maka kembalikan false
      return false;
    } on DioException catch (e) {
      // Jika terjadi error, maka ambil pesan error dan simpan ke GetStorage
      final errorRes = e.response;
      String message = errorRes?.data['error']; // ambil pesan error
      box.write("errMsg", message);
      log(message);
      return false;
    }
  }
}
