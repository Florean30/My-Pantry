import 'package:my_pantry/app/data/models/jenis/jenis_kategori.dart';
import 'package:my_pantry/app/data/models/kelola/aktivitas_kelola.dart';
import 'package:my_pantry/app/data/models/kelola/jumlah_kelola.dart';
import 'package:my_pantry/app/data/models/kelola/penyimpanan_kelola.dart';

// Model untuk mengelola item dalam pantry
class KelolaItem {
  // Kategori item (mis: makanan, minuman, dll)
  final JenisCategory category;
  // Nama item
  final String name;
  // Jenis aktivitas (mis: masuk, keluar)
  final Activity activity;
  // Tanggal aktivitas dilakukan
  final DateTime activityDate;
  // Tanggal kadaluarsa item
  final DateTime expiryDate;
  // Jumlah/kuantitas item
  final Quantity quantity;
  // Lokasi penyimpanan item
  final StorageEnum storage;

  // Constructor untuk membuat instance KelolaItem
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
