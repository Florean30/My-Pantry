import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'listkategori_controller.dart';
import 'package:mypantry_app/app/routes/kelola_routes.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/widgets/custom_footer_home.dart';

// Halaman untuk list kategori
class ListkategoriPage extends GetView<ListkategoriController> {
  const ListkategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SafeArea(
              child: InkWell(
                onTap: () => Get.back(),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                children: [
                  // Judul kategori
                  const Text(
                    'Sayuran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 30),
                  // Jumlah bahan makanan
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(text: 'Anda mempunyai '),
                          TextSpan(
                            text: '30',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.orange,
                            ),
                          ),
                          TextSpan(
                              text: ' macam bahan makanan dikategori ini.'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Garis pembatas
            const Divider(
              color: AppColors.darkgreen,
              thickness: 4,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 20),
            // Input pencarian
            TextField(
              style: const TextStyle(color: AppColors.white),
              cursorColor: AppColors.white,
              decoration: InputDecoration(
                constraints: const BoxConstraints(
                  maxHeight: 40,
                  maxWidth: 300,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                hintText: 'Daun Jeruk',
                hintStyle: const TextStyle(color: AppColors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: AppColors.orange,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: AppColors.orange,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: AppColors.orange,
                  ),
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  color: AppColors.white,
                  size: 30,
                ),
                suffixIconConstraints: const BoxConstraints(
                  minHeight: 60,
                  minWidth: 80,
                ),
                filled: true,
                fillColor: AppColors.orange,
              ),
            ),
            const SizedBox(height: 20),
            // Daftar jenis bahan makanan
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  // Generate 30 jenis bahan makanan
                  children: List.generate(
                    30,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        color: AppColors.lightgreen,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nama jenis bahan makanan
                              const Row(
                                children: [
                                  Text(
                                    'Daun Jeruk',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              // Tombol kelola
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(KelolaRoutes.kelola);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orange,
        onPressed: () {
          Get.toNamed(KelolaRoutes.kelola);
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      bottomNavigationBar: const CustomFooterHome(),
    );
  }
}
