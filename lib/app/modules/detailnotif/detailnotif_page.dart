import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/extensions/date_time_ext.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/core/widgets/custom_footer_home.dart';
import 'package:my_pantry/app/routes/kelola_routes.dart';
import 'detailnotif_controller.dart';

// Halaman untuk menampilkan detail notifikasi
class DetailnotifPage extends GetView<DetailnotifController> {
  const DetailnotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body menggunakan SingleChildScrollView agar konten bisa di scroll
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Widget SafeArea untuk memastikan konten tidak tertutup notch/status bar
            SafeArea(
              // InkWell untuk membuat area yang bisa di tap
              child: InkWell(
                // Fungsi untuk kembali ke halaman sebelumnya
                onTap: () {
                  Get.back();
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/icon/back.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),

            // ListView untuk menampilkan daftar item yang kadaluarsa
            Expanded(
              child: ListView.builder(
                itemCount: controller.expiredItem.data.length,
                itemBuilder: (context, index) {
                  // Mengambil data item yang kadaluarsa
                  final expiredStorage = controller.expiredItem.data[index];

                  return CardDetailStorageItem(
                    nama: expiredStorage.name,
                    kadaluwarsa: expiredStorage.expiryDate!.toFormattedDate(),
                    jumlah: expiredStorage.quantity,
                    penyimpanan: expiredStorage.storageLocation,
                    onKelola: () {
                      // Navigasi ke halaman kelola dengan membawa data
                      Get.toNamed(
                        KelolaRoutes.kelola,
                        arguments: [
                          expiredStorage.id,
                          expiredStorage.categoryId,
                          controller.expiredItem.categoryName,
                        ],
                      );
                    },
                    onDelete: () {
                      // Menghapus item berdasarkan index
                      controller.onDeleteStorageById(index);
                    },
                  );
                },
              ),
            ),
            // Widget dropdown custom untuk kelola item

            const SizedBox(height: 24),
          ],
        ),
      ),
      // Widget footer custom di bagian bawah
      bottomNavigationBar: const CustomFooterHome(),
    );
  }
}

// Widget card untuk menampilkan detail item yang kadaluarsa
class CardDetailStorageItem extends StatelessWidget {
  // Deklarasi properti yang diperlukan
  final String nama;
  final String kadaluwarsa;
  final int jumlah;
  final String penyimpanan;
  final void Function()? onKelola;
  final void Function()? onDelete;

  const CardDetailStorageItem({
    super.key,
    required this.nama,
    required this.kadaluwarsa,
    required this.jumlah,
    required this.penyimpanan,
    required this.onKelola,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightgreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menampilkan nama item dengan style khusus
            Text(
              nama,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Menampilkan informasi detail item
            // ... existing rows ...

            // Field untuk memilih tanggal kadaluarsa
            Row(
              children: [
                const Expanded(child: Text('Kadaluwarsa')),
                const Text(': '),
                Expanded(child: Text(kadaluwarsa)),
              ],
            ),

            // Field untuk memilih tanggal aktivitas
            Row(
              children: [
                const Expanded(child: Text('Jumlah')),
                const Text(': '),
                Expanded(child: Text(jumlah.toString())),
              ],
            ),

            // Field untuk memilih lokasi penyimpanan
            Row(
              children: [
                const Expanded(child: Text('Penyimpanan')),
                const Text(': '),
                Expanded(child: Text(penyimpanan)),
              ],
            ),

            // Tombol aksi (Hapus dan Kelola)
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Tombol Hapus
                  ElevatedButton(
                    onPressed: onDelete,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: const Size(61, 26),
                    ),
                    child: const Text(
                      'Hapus',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  // Tombol Kelola
                  ElevatedButton(
                    onPressed: onKelola,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: const Size(61, 26),
                    ),
                    child: const Text(
                      'Kelola',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
