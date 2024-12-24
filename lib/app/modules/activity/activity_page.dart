import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/modules/activity/activity_controller.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/widgets/custom_footer_home.dart';

// Halaman untuk activity
class ActivityPage extends GetView<ActivityController> {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepwhite,
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
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),

              // Judul halaman
              const Text(
                'Activity',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),

              // Garis pemisah di bawah judul
              const Divider(
                color: AppColors.darkgreen,
                thickness: 4,
                indent: 20,
                endIndent: 20,
              ),

              const SizedBox(height: 16),

              // Daftar aktivitas dalam bentuk ListView
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  // Item card yang menampilkan detail aktivitas
                  itemBuilder: (context, index) => const Card(
                    color: AppColors.lightgreen,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // Judul kategori
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Bumbu Kering",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          // Detail informasi aktivitas
                          // Nama item
                          Row(
                            children: [
                              Expanded(child: Text('Nama')),
                              Text(':'),
                              Expanded(child: Text(' Garam')),
                            ],
                          ),
                          // Jenis aktivitas
                          Row(
                            children: [
                              Expanded(child: Text('Aktivitas')),
                              Text(':'),
                              Expanded(child: Text(' Belanja')),
                            ],
                          ),
                          // Tanggal aktivitas
                          Row(
                            children: [
                              Expanded(child: Text('Tanggal Aktivitas')),
                              Text(':'),
                              Expanded(child: Text(' 30/12/2024')),
                            ],
                          ),
                          // Jumlah item
                          Row(
                            children: [
                              Expanded(child: Text('Jumlah')),
                              Text(':'),
                              Expanded(child: Text(' 12 Pcs')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Tombol aksi di bagian bawah
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol print
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/icon/print.png",
                      width: 50.0,
                    ),
                  ),
                  // Tombol hapus
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/icon/trash.png",
                      width: 50.0,
                    ),
                  ),
                ],
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
