import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'kelola_controller.dart';
import 'package:mypantry_app/app/core/widgets/custom_kelola_item.dart';
import 'package:mypantry_app/app/core/widgets/custom_footer_home.dart';

// Halaman untuk kelola
class KelolaPage extends GetView<KelolaController> {
  const KelolaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body menggunakan SingleChildScrollView agar konten bisa di scroll
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
            // Widget dropdown custom untuk kelola item
            const CustomDropdownKelolaItem(),
            const SizedBox(height: 24),
          ],
        ),
      ),
      // Widget footer custom di bagian bawah
      bottomNavigationBar: const CustomFooterHome(),
    );
  }
}
