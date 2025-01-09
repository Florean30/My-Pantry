enum Activity { belanja, memasak }

extension ActivityExtension on Activity {
  String get name {
    switch (this) {
      case Activity.belanja:
        return 'Belanja';
      case Activity.memasak:
        return 'Memasak';
    }
  }
}
