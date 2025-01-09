// Import model JenisCategory yang dibutuhkan
import 'package:my_pantry/app/data/models/jenis/jenis_kategori.dart';

// Model class untuk item jenis
class JenisItem {
  // Properti untuk menyimpan data item
  final String id; // ID unik item
  final String title; // Judul/nama item
  final String imagePath; // Path gambar item
  final JenisCategory category; // Kategori item
  final bool isSelected; // Status seleksi item
  final bool isAsset; // Flag apakah gambar dari asset atau tidak

  // Constructor dengan parameter wajib dan opsional
  const JenisItem({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.category,
    this.isSelected = false, // Nilai default false
    this.isAsset = true, // Nilai default true
  });

  // Method untuk membuat salinan objek dengan nilai yang dapat diubah
  JenisItem copyWith({
    String? id,
    String? title,
    String? imagePath,
    JenisCategory? category,
    bool? isSelected,
    bool? isAsset,
  }) {
    return JenisItem(
      id: id ?? this.id, // Gunakan nilai baru jika ada, atau nilai lama
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      isSelected: isSelected ?? this.isSelected,
      isAsset: isAsset ?? this.isAsset,
    );
  }
}
