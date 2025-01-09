enum StorageEnum { kulkas, lemari }

extension StorageExtension on StorageEnum {
  String get name {
    switch (this) {
      case StorageEnum.kulkas:
        return 'Kulkas';
      case StorageEnum.lemari:
        return 'Lemari';
    }
  }
}
