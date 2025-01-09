import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_pantry/app/core/services/api_endpoint.dart';
import 'package:my_pantry/app/core/services/network_services.dart';
import 'package:my_pantry/app/data/models/storage/storages_model.dart';

// repository untuk mengelola operasi storage
class StorageRepositories {
  // Inisialisasi GetStorage untuk menyimpan data
  final box = GetStorage();

  // Method untuk mendapatkan semua storage
  Future<List<StoragesModel>> getAllStorages() async {
    try {
      // Membuat request GET ke endpoint storage
      final request = ApiRequest();
      var response = await request.get(storageUrl);
      JSON obj = response.data;

      // Jika status code 200, maka ambil data storage dan kembalikan
      if (response.statusCode == 200) {
        final data = obj['data'] as List;
        final storages = data.map((e) => StoragesModel.fromJson(e)).toList();
        return storages;
      }
      // Jika status code bukan 200, maka kembalikan list kosong
      return [];
    } on DioException catch (e) {
      final errorRes = e.response;
      String message = errorRes?.data['error']; // ambil pesan error
      box.write("errMsg", message);
      log(message);
      rethrow;
    }
  }

  // Method untuk mendapatkan storage berdasarkan ID
  Future<StoragesModel> getStorageById({int? storageId}) async {
    try {
      // Membuat request GET ke endpoint storage berdasarkan ID
      final request = ApiRequest();
      var response = await request.get("$storageUrl/$storageId");
      JSON data = response.data;

      // Inisialisasi storage dengan null
      StoragesModel? storage;

      // Jika status code 200, maka ambil data storage dan kembalikan
      if (response.statusCode == 200) {
        storage = StoragesModel.fromJson(data);
        return storage;
      }
      return storage!;
    } on DioException catch (e) {
      final errorRes = e.response;
      String message = errorRes?.data['error']; // ambil pesan error
      box.write("errMsg", message);
      log(message);
      rethrow;
    }
  }

  Future<StoragesModel> createStorage({
    required String name,
    required String activity,
    required String activityDate,
    required String expiryDate,
    required int quantity,
    required String storageLocation,
    required int categoryId,
  }) async {
    try {
      final request = ApiRequest();

      final response = await request.post(
        storageUrl,
        data: {
          "name": name,
          "activity": activity,
          "activityDate": activityDate,
          "expiryDate": expiryDate,
          "quantity": quantity,
          "storageLocation": storageLocation,
          "categoryId": categoryId
        },
      );
      JSON obj = response.data;
      StoragesModel? storage;

      if (response.statusCode == 201) {
        storage = StoragesModel.fromJson(obj);
        return storage;
      }
      return storage!;
    } on DioException catch (e) {
      final errorRes = e.response;
      String message = errorRes?.data['error']; // ambil pesan error
      box.write("errMsg", message);
      log(message);
      rethrow;
    }
  }

  Future<StoragesModel> updateStorage({
    required int storageId,
    required String name,
    required String activity,
    required String activityDate,
    required String expiryDate,
    required int quantity,
    required String storageLocation,
  }) async {
    try {
      final request = ApiRequest();

      final response = await request.put(
        "$storageUrl/$storageId",
        data: {
          "name": name,
          "activity": activity,
          "activityDate": activityDate,
          "expiryDate": expiryDate,
          "quantity": quantity,
          "storageLocation": storageLocation,
        },
      );
      JSON obj = response.data;
      StoragesModel? storage;

      if (response.statusCode == 200) {
        storage = StoragesModel.fromJson(obj);
        return storage;
      }
      return storage!;
    } on DioException catch (e) {
      final errorRes = e.response;
      String message = errorRes?.data['error']; // ambil pesan error
      box.write("errMsg", message);
      log(message);
      rethrow;
    }
  }

  // Method untuk menghapus storage berdasarkan ID
  Future<bool> deleteStorageById({int? storageId}) async {
    try {
      // Membuat request DELETE ke endpoint storage berdasarkan ID
      final request = ApiRequest();
      var response = await request.delete("$storageUrl/$storageId");

      // Jika status code 200, maka kembalikan true
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (e) {
      final errorRes = e.response;
      String message = errorRes?.data['error']; // ambil pesan error
      box.write("errMsg", message);
      log(message);
      return false;
    }
  }
}
