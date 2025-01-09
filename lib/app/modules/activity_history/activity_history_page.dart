import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/extensions/date_time_ext.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'activity_history_controller.dart';

// Halaman untuk menampilkan riwayat aktivitas
class ActivityHistoryPage extends GetView<ActivityHistoryController> {
  const ActivityHistoryPage({super.key});

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
                      'assets/icon/back.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Judul halaman
              InkWell(
                onTap: () {
                  controller.getActivities();
                },
                child: const Text(
                  'Activity',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
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
              Obx(() {
                if (controller.isLoading.value) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.darkgreen,
                      ),
                    ),
                  );
                }
                if (controller.activities.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        'Tidak ada data aktivitas',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: RefreshIndicator(
                    color: AppColors.freshgreen,
                    onRefresh: () async {
                      await controller.onRefresh();
                    },
                    child: ListView.separated(
                      itemCount: controller.activities.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      // Item card yang menampilkan detail aktivitas
                      itemBuilder: (context, index) {
                        final data = controller.activities[index];

                        return Card(
                          color: AppColors.lightgreen,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                // Judul kategori
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        data.category!.nameCategory,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                // Detail informasi aktivitas
                                // Nama item
                                Row(
                                  children: [
                                    const Expanded(child: Text('Nama')),
                                    const Text(': '),
                                    Expanded(child: Text(data.name)),
                                  ],
                                ),
                                // Jenis aktivitas
                                Row(
                                  children: [
                                    const Expanded(child: Text('Aktivitas')),
                                    const Text(': '),
                                    Expanded(child: Text(data.activity)),
                                  ],
                                ),
                                // Tanggal aktivitas
                                Row(
                                  children: [
                                    const Expanded(
                                        child: Text('Tanggal Aktivitas')),
                                    const Text(': '),
                                    Expanded(
                                        child: Text(data.activityDate!
                                            .toFormattedDate())),
                                  ],
                                ),
                                // Jumlah item
                                Row(
                                  children: [
                                    const Expanded(child: Text('Jumlah')),
                                    const Text(': '),
                                    Expanded(
                                        child: Text("${data.quantity} Pcs")),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
              const SizedBox(height: 15),
              // Tombol aksi di bagian bawah
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol print
                  InkWell(
                    onTap: () async {
                      // Memanggil fungsi untuk mengunduh PDF dari controller
                      await controller.generateDownloadPDF();
                    },
                    child: Image.asset(
                      "assets/icon/print.png",
                      width: 50.0,
                    ),
                  ),
                  //Tombol hapus
                  InkWell(
                    onTap: () {
                      controller.activities.clear();
                    },
                    child: Image.asset(
                      "assets/icon/trash.png",
                      width: 50.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
