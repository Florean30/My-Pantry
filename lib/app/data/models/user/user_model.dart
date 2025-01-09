import 'package:equatable/equatable.dart';

// Model untuk menyimpan data user
class UserModel extends Equatable {
  // Constructor dengan parameter wajib
  const UserModel({
    required this.id,
    required this.email,
    required this.namaLengkap,
  });

  // ID user
  final int id;
  static const String idKey = "id";

  // Email user
  final String email;
  static const String emailKey = "email";

  // Nama lengkap user
  final String namaLengkap;
  static const String namaLengkapKey = "nama_lengkap";

  // Factory constructor untuk membuat objek dari JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? 0, // Jika null, gunakan 0 sebagai default
      email: json["email"] ?? "", // Jika null, gunakan string kosong
      namaLengkap:
          json["nama_lengkap"] ?? "", // Jika null, gunakan string kosong
    );
  }

  // Mengkonversi objek ke format JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nama_lengkap": namaLengkap,
      };

  // Override toString untuk debugging
  @override
  String toString() {
    return "$id, $email, $namaLengkap, ";
  }

  // Override props untuk perbandingan objek (dari Equatable)
  @override
  List<Object?> get props => [
        id,
        email,
        namaLengkap,
      ];
}
