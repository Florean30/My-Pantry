import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'addkategori_controller.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/widgets/custom_footer_home.dart';

// Halaman untuk menambah kategori bahan makanan
class AddkategoriPage extends GetView<AddKategoriController> {
  const AddkategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Tombol kembali ke halaman sebelumnya
              SafeArea(
                child: InkWell(
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
              const SizedBox(height: 30),
              // Judul halaman
              const Text(
                'Tambah Kategori\nBahan Makanan',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              // Garis pemisah
              const Divider(
                color: AppColors.darkgreen,
                thickness: 4,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 20),
              // Form container untuk input data kategori
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.lightgreen,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bagian input nama dan gambar
                      SizedBox(
                        width: 192,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Field nama kategori
                            const Text(
                              'Nama     : Umbi-umbian',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 18),
                            // Field upload gambar
                            Row(
                              children: [
                                const Text(
                                  'Gambar :',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                // Tombol Add Photo
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                    vertical: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: const Text(
                                    'Add Photo',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                // Icon kamera
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    'assets/images/icon/cam.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 13),
                      // Tombol Save
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            minimumSize: const Size(61, 26),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
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
      // Widget footer kustom
      bottomNavigationBar: const CustomFooterHome(),
    );
  }
}
