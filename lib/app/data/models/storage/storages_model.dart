import 'package:equatable/equatable.dart';

// Model untuk menyimpan data penyimpanan barang
class StoragesModel extends Equatable {
  // Constructor dengan parameter wajib
  const StoragesModel({
    required this.id,
    required this.name,
    required this.activity,
    required this.activityDate,
    required this.expiryDate,
    required this.quantity,
    required this.storageLocation,
    required this.userId,
    required this.categoryId,
    required this.category,
  });

  // Properti untuk menyimpan data barang
  final int id; // ID unik barang
  final String name; // Nama barang
  final String activity; // Aktivitas terkait barang
  final DateTime? activityDate; // Tanggal aktivitas
  final DateTime? expiryDate; // Tanggal kadaluarsa
  final int quantity; // Jumlah barang
  final String storageLocation; // Lokasi penyimpanan
  final int userId; // ID pengguna pemilik
  final int categoryId; // ID kategori barang
  final Category? category; // Data kategori barang

  // Method untuk membuat salinan objek dengan nilai yang diperbarui
  StoragesModel copyWith({
    int? id,
    String? name,
    String? activity,
    DateTime? activityDate,
    DateTime? expiryDate,
    int? quantity,
    String? storageLocation,
    int? userId,
    int? categoryId,
    Category? category,
  }) {
    return StoragesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      activity: activity ?? this.activity,
      activityDate: activityDate ?? this.activityDate,
      expiryDate: expiryDate ?? this.expiryDate,
      quantity: quantity ?? this.quantity,
      storageLocation: storageLocation ?? this.storageLocation,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      category: category ?? this.category,
    );
  }

  // Factory constructor untuk membuat objek dari JSON
  factory StoragesModel.fromJson(Map<String, dynamic> json) {
    return StoragesModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      activity: json["activity"] ?? "",
      activityDate: DateTime.tryParse(json["activityDate"] ?? ""),
      expiryDate: DateTime.tryParse(json["expiryDate"] ?? ""),
      quantity: json["quantity"] ?? 0,
      storageLocation: json["storageLocation"] ?? "",
      userId: json["userId"] ?? 0,
      categoryId: json["categoryId"] ?? 0,
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
    );
  }

  // Method untuk mengkonversi objek ke JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "activity": activity,
        "activityDate": activityDate?.toIso8601String(),
        "expiryDate": expiryDate?.toIso8601String(),
        "quantity": quantity,
        "storageLocation": storageLocation,
        "userId": userId,
        "categoryId": categoryId,
        "category": category?.toJson(),
      };

  @override
  String toString() {
    return "$id, $name, $activity, $activityDate, $expiryDate, $quantity, $storageLocation, $userId, $categoryId, $category, ";
  }

  @override
  List<Object?> get props => [
        id,
        name,
        activity,
        activityDate,
        expiryDate,
        quantity,
        storageLocation,
        userId,
        categoryId,
        category,
      ];
}

// Model untuk menyimpan data kategori barang
class Category extends Equatable {
  // Constructor dengan parameter wajib
  const Category({
    required this.id,
    required this.nameCategory,
    required this.picture,
  });

  // Properti untuk menyimpan data kategori
  final int id; // ID unik kategori
  final String nameCategory; // Nama kategori
  final String picture; // URL gambar kategori

  // Method untuk membuat salinan objek dengan nilai yang diperbarui
  Category copyWith({
    int? id,
    String? nameCategory,
    String? picture,
  }) {
    return Category(
      id: id ?? this.id,
      nameCategory: nameCategory ?? this.nameCategory,
      picture: picture ?? this.picture,
    );
  }

  // Factory constructor untuk membuat objek dari JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] ?? 0,
      nameCategory: json["name_category"] ?? "",
      picture: json["picture"] ?? "",
    );
  }

  // Method untuk mengkonversi objek ke JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "name_category": nameCategory,
        "picture": picture,
      };

  @override
  String toString() {
    return "$id, $nameCategory, $picture, ";
  }

  @override
  List<Object?> get props => [
        id,
        nameCategory,
        picture,
      ];
}
