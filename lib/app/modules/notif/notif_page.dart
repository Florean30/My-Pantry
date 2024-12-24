import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/routes/kelola_routes.dart';
import 'notif_controller.dart';

class NotifPage extends GetView<NotifController> {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Spacing atas
                  const SizedBox(height: 16),
                  // Widget untuk tombol kembali
                  SafeArea(
                    child: InkWell(
                      onTap: () {
                        // Kembali ke halaman sebelumnya
                        Get.back();
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          'assets/images/icon/back.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: AppColors.lightgreen,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Menampilkan judul kategori
                                const Text(
                                  'Bumbu Basah',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    // Widget untuk menampilkan teks informasi stok
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                            color: AppColors.black,
                                          ),
                                          children: [
                                            const TextSpan(
                                                text: 'Anda mempunyai '),
                                            // Menampilkan jumlah stok dengan warna orange
                                            TextSpan(
                                              text: 2.toString(),
                                              style: const TextStyle(
                                                color: AppColors.orange,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const TextSpan(
                                                text:
                                                    ' macam bahan makanan dijenis ini.'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Widget untuk menampilkan gambar kategori
                                    Expanded(
                                      child: Container(
                                        height: 120.0,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/kategori/basah.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Tombol untuk melihat detail kategori
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.orange,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.toNamed(KelolaRoutes.kelola);
                                  },
                                  child: const Text("Lihat"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
