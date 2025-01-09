import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_pantry/app/core/services/api_endpoint.dart';
import 'package:my_pantry/app/core/services/network_services.dart';

// repository untuk mengelola operasi autentikasi
class AuthRepository {
  // Inisialisasi GetStorage untuk menyimpan data
  final box = GetStorage();

  // Method untuk login
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      // Membuat request POST ke endpoint login
      final request = ApiRequest();
      final response = await request.post(
        loginUrl,
        data: {
          "email": email,
          "password": password,
        },
      );
      // Mengubah response menjadi JSON
      JSON obj = response.data;

      // Jika status code 200, maka simpan data user dan token ke GetStorage
      if (response.statusCode == 200) {
        box.write("USER_ID", obj["user"]["id"]);
        box.write("TOKEN", obj["token"]);
        log("Token : ${box.read("TOKEN")}");
        log("User ID : ${box.read("USER_ID")}");
        return true;
      }
      // Jika status code bukan 200, maka kembalikan false
      return false;
    } on DioException catch (e) {
      // Jika terjadi error, maka ambil pesan error dan simpan ke GetStorage
      final errorRes = e.response;
      String message = errorRes?.data['error']; // ambil pesan error
      box.write("errMsg", message);
      log(message);
      // Kembalikan false jika login gagal
      return false;
    }
  }

  // Method untuk register
  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // Membuat request POST ke endpoint register
      final request = ApiRequest();
      // Mengirim data ke endpoint register
      var response = await request.post(
        registerUrl,
        data: {
          "nama_lengkap": name,
          "email": email,
          "password": password,
        },
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
      // Kembalikan false jika register gagal
      return false;
    }
  }

  // Method untuk logout
  Future<bool> logout() async {
    try {
      // Membuat request POST ke endpoint logout
      final request = ApiRequest();
      // Mengirim data ke endpoint logout
      var response = await request.post(logoutUrl);
      // Jika status code 200, maka hapus data user dan token dari GetStorage
      if (response.statusCode == 200) {
        box.erase();
        log("Token : ${box.read("TOKEN")}");
        return true;
      }
      // Jika status code bukan 200, maka kembalikan false
      return false;
    } on DioException catch (e) {
      // Jika terjadi error, maka ambil pesan error dan simpan ke GetStorage
      final errorRes = e.response;
      String message = errorRes?.data['error']; // ambil pesan error
      box.write("errMsg", message);
      log(message);
      // Kembalikan false jika logout gagal
      return false;
    }
  }
}
