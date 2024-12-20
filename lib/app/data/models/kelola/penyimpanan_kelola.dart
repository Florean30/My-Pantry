enum Storage {
  kulkas,
  lemari
}

extension StorageExtension on Storage {
  String get name {
    switch (this) {
      case Storage.kulkas:
        return 'Kulkas';
      case Storage.lemari:
        return 'Lemari';
      default:
        return '';
    }
  }
}