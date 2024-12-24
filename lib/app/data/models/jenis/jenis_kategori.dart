enum JenisCategory {
  kering,
  basah,
  sayur,
  buah,
  lauk,
}

extension JenisCategoryExtension on JenisCategory {
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
