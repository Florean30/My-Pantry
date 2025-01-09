import 'package:my_pantry/app/data/models/category/categories_model.dart';

// Model untuk menyimpan data kategori yang kadaluarsa
class ExpiredCategory {
  // Nama kategori
  final String categoryName;
  // Jumlah item yang kadaluwarsa
  final int expiredCount;
  // List data penyimpanan
  final List<Storage> data;
  // URL gambar kategori
  final String imageUrl;

  // Constructor
  ExpiredCategory({
    required this.categoryName,
    required this.expiredCount,
    required this.data,
    required this.imageUrl,
  });

  // Mengkonversi objek ke format JSON
  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "expired_count": expiredCount,
        "data": data.map((x) => x.toJson()).toList(),
        "image_url": imageUrl,
      };
}
