import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_pantry/app/core/services/api_endpoint.dart';
import 'package:my_pantry/app/core/services/network_services.dart';
import 'package:my_pantry/app/data/models/user/user_model.dart';

// repository untuk mengelola operasi profil
class ProfileRepository {
  // Inisialisasi GetStorage untuk menyimpan data
  final box = GetStorage();

  // Method untuk mendapatkan data user
  Future<UserModel> getUser() async {
    int id = box.read("USER_ID");
    try {
      final request = ApiRequest();

      var response = await request.get("$profileUrl/$id");
      UserModel? user;
      if (response.statusCode == 200) {
        user = UserModel.fromJson(response.data);
        return user;
      }
      return user!;
    } on DioException catch (e) {
      final errorRes = e.response;
      String message = errorRes?.data['error']; // ambil pesan error
      box.write("errMsg", message);
      log(message);
      rethrow;
    }
  }

  // Method untuk mengedit data user
  Future<bool> editProfile({
    required String name,
    required String email,
    required String password,
  }) async {
    int id = box.read("USER_ID");
    try {
      // Membuat request PUT ke endpoint edit profil
      final request = ApiRequest();

      var response = await request.put(
        "$editProfileUrl/$id",
        data: {
          "nama_lengkap": name,
          "email": email,
          "password": password,
        },
      );

      // Jika status code 200, maka kembalikan true
      if (response.statusCode == 200) {
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
      // Kembalikan false jika edit profil gagal
      return false;
    }
  }
}

// Kelas untuk mengelola data user
class UserManager {
  static final UserManager instance = UserManager._internal();

  // Method untuk mendapatkan instance UserManager
  factory UserManager() {
    return instance;
  }

  // Constructor internal untuk membuat instance UserManager
  UserManager._internal();

  // Variabel untuk menyimpan data user
  UserModel? _currentUser;

  // Method untuk mendapatkan data user
  UserModel? get currentUser => _currentUser;

  // Memuat data user dari repository
  Future<void> loadUserData() async {
    final response = await ProfileRepository().getUser();
    _currentUser = response;
  }
}
