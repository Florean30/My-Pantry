// Enum untuk mendefinisikan kategori jenis bahan makanan
enum JenisCategory {
  kering, // Kategori bumbu kering
  basah, // Kategori bumbu basah
  sayur, // Kategori sayuran
  buah, // Kategori buah-buahan
  lauk, // Kategori lauk pauk
}

// Extension untuk menambahkan fungsi tambahan pada enum JenisCategory
extension JenisCategoryExtension on JenisCategory {
  // Getter untuk mendapatkan nama yang ditampilkan untuk setiap kategori
  String get displayName {
    switch (this) {
      case JenisCategory.kering:
        return 'Bumbu kering';
      case JenisCategory.basah:
        return 'Bumbu basah';
      case JenisCategory.sayur:
        return 'Sayuran';
      case JenisCategory.buah:
        return 'Buah-buahan';
      case JenisCategory.lauk:
        return 'Lauk pauk';
    }
  }
}
