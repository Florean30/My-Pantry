import 'package:mypantry_app/app/data/models/jenis/jenis_kategori.dart';

class JenisItem {
  final String id;
  final String title;
  final String imagePath; 
  final JenisCategory category;
  final bool isSelected;
  final bool isAsset;

  static var kering; 
  static var basah; 
  static var sayur; 
  static var buah; 
  static var lauk; 

  const JenisItem({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.category,
    this.isSelected = false,
    this.isAsset = true, 
  });

  JenisItem copyWith({
    String? id,
    String? title,
    String? imagePath,
    JenisCategory? category,
    bool? isSelected,
    bool? isAsset,
  }) {
    return JenisItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      isSelected: isSelected ?? this.isSelected,
      isAsset: isAsset ?? this.isAsset,
    );
  }
}