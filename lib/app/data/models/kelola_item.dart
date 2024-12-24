import 'package:mypantry_app/app/data/models/jenis/jenis_kategori.dart';
import 'package:mypantry_app/app/data/models/kelola/aktivitas_kelola.dart';
import 'package:mypantry_app/app/data/models/kelola/jumlah_kelola.dart';
import 'package:mypantry_app/app/data/models/kelola/penyimpanan_kelola.dart';

class KelolaItem {
  final JenisCategory category;
  final String name;
  final Activity activity;
  final DateTime activityDate;
  final DateTime expiryDate;
  final Quantity quantity;
  final Storage storage;

  KelolaItem({
    required this.category,
    required this.name,
    required this.activity,
    required this.activityDate,
    required this.expiryDate,
    required this.quantity,
    required this.storage,
  });
}
