import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detailnotif_controller.dart';
import 'package:mypantry_app/app/routes/kelola_routes.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/widgets/custom_footer_home.dart';

// Halaman untuk kelola
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
                    'assets/images/icon/back.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
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
                          // Judul kategori item
                          const Text(
                            "Bumbu Basah",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Menampilkan nama item
                          const Row(
                            children: [
                              Expanded(child: Text('Nama')),
                              Text(':'),
                              Expanded(child: Text(' Kecap')),
                            ],
                          ),

                          // Field untuk memilih tanggal kadaluarsa
                          const Row(
                            children: [
                              Expanded(child: Text('Kadaluwarsa')),
                              Text(':'),
                              Expanded(child: Text(' 01/01/2025')),
                            ],
                          ),

                          // Field untuk memilih tanggal aktivitas
                          const Row(
                            children: [
                              Expanded(child: Text('Jumlah')),
                              Text(':'),
                              Expanded(child: Text(' 1')),
                            ],
                          ),

                          // Field untuk memilih lokasi penyimpanan
                          const Row(
                            children: [
                              Expanded(child: Text('Penyimpanan')),
                              Text(':'),
                              Expanded(child: Text(' Lemari')),
                            ],
                          ),

                          // Tombol Save
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
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
                                ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(KelolaRoutes.kelola);
                                  },
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
