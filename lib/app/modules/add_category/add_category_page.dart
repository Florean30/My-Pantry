import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/helpers/validator.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/core/widgets/custom_footer_home.dart';
import 'package:my_pantry/app/core/widgets/custom_text_field.dart';
import 'add_category_controller.dart';

// Halaman untuk menambah kategori baru
class AddCategoryPage extends GetView<AddCategoryController> {
  const AddCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // Area utama aplikasi yang aman dari notch/sensor
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
                      'assets/icon/back.png',
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
              // Container utama untuk form input kategori
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.lightgreen,
                  borderRadius: BorderRadius.circular(7),
                ),
                // Form untuk validasi input
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Area input untuk nama dan gambar kategori
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10.0),
                            // Field nama kategori
                            Row(
                              children: [
                                const Text(
                                  'Nama',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 17.0),
                                const Text(
                                  ':',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: CustomSimpleTextForm(
                                    label: '',
                                    controller: controller.nameController,
                                    validator: Validator.required,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            // Input field untuk URL gambar
                            Row(
                              children: [
                                const Text(
                                  'Gambar',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                const Text(
                                  ':',
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: CustomSimpleTextForm(
                                    controller: controller.imageController,
                                    label: '',
                                    maxLines: 3,
                                    constraints: const BoxConstraints(),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '*masukkan url gambar';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                // Ikon kamera
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(
                                    'assets/icon/cam.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Tombol untuk menyimpan data kategori
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.addCategory();
                          },
                          // Konfigurasi style tombol
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            minimumSize: const Size(61, 26),
                          ),
                          // Text tombol dengan status loading
                          child: Obx(() {
                            return Text(
                              controller.isLoading.value
                                  ? 'Loading...'
                                  : 'Save',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            );
                          }),
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
      // Widget footer kustom di bagian bawah
      bottomNavigationBar: const CustomFooterHome(),
    );
  }
}
