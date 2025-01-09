import 'package:equatable/equatable.dart';

// Model untuk kategori yang menyimpan informasi kategori dan daftar penyimpanan
class CategoriesModel extends Equatable {
  const CategoriesModel({
    required this.id,
    required this.nameCategory,
    required this.picture,
    required this.storages,
  });

  // Properti untuk menyimpan data kategori
  final int id;                  // ID kategori
  final String nameCategory;     // Nama kategori
  final String picture;          // URL gambar kategori
  final List<Storage> storages;  // Daftar penyimpanan dalam kategori

  // Method untuk membuat salinan objek dengan nilai yang dapat diubah
  CategoriesModel copyWith({
    int? id,
    String? nameCategory,
    String? picture,
    List<Storage>? storages,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      nameCategory: nameCategory ?? this.nameCategory,
      picture: picture ?? this.picture,
      storages: storages ?? this.storages,
    );
  }

  // Factory constructor untuk membuat objek dari JSON
  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json["id"] ?? 0,
      nameCategory: json["name_category"] ?? "",
      picture: json["picture"] ?? "",
      storages: json["storages"] == null
          ? []
          : List<Storage>.from(
              json["storages"]!.map((x) => Storage.fromJson(x))),
    );
  }

  // Method untuk mengkonversi objek ke JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "name_category": nameCategory,
        "picture": picture,
        "storages": storages.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$id, $nameCategory, $picture, $storages, ";
  }

  @override
  List<Object?> get props => [
        id,
        nameCategory,
        picture,
        storages,
      ];
}

// Model untuk menyimpan informasi penyimpanan
class Storage extends Equatable {
  const Storage({
    required this.id,
    required this.name,
    required this.activity,
    required this.activityDate,
    required this.expiryDate,
    required this.quantity,
    required this.storageLocation,
    required this.userId,
    required this.categoryId,
  });

  // Properti untuk menyimpan data penyimpanan
  final int id;                    // ID penyimpanan
  final String name;               // Nama item
  final String activity;           // Aktivitas terkait
  final DateTime? activityDate;    // Tanggal aktivitas
  final DateTime? expiryDate;      // Tanggal kadaluarsa
  final int quantity;              // Jumlah item
  final String storageLocation;    // Lokasi penyimpanan
  final int userId;                // ID pengguna
  final int categoryId;            // ID kategori

  // Method untuk membuat salinan objek dengan nilai yang dapat diubah
  Storage copyWith({
    int? id,
    String? name,
    String? activity,
    DateTime? activityDate,
    DateTime? expiryDate,
    int? quantity,
    String? storageLocation,
    int? userId,
    int? categoryId,
  }) {
    return Storage(
      id: id ?? this.id,
      name: name ?? this.name,
      activity: activity ?? this.activity,
      activityDate: activityDate ?? this.activityDate,
      expiryDate: expiryDate ?? this.expiryDate,
      quantity: quantity ?? this.quantity,
      storageLocation: storageLocation ?? this.storageLocation,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  // Factory constructor untuk membuat objek dari JSON
  factory Storage.fromJson(Map<String, dynamic> json) {
    return Storage(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      activity: json["activity"] ?? "",
      activityDate: DateTime.tryParse(json["activityDate"] ?? ""),
      expiryDate: DateTime.tryParse(json["expiryDate"] ?? ""),
      quantity: json["quantity"] ?? 0,
      storageLocation: json["storageLocation"] ?? "",
      userId: json["userId"] ?? 0,
      categoryId: json["categoryId"] ?? 0,
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
      };

  @override
  String toString() {
    return "$id, $name, $activity, $activityDate, $expiryDate, $quantity, $storageLocation, $userId, $categoryId, ";
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
      ];
}
