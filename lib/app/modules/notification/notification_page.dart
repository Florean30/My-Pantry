import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/core/widgets/custom_footer_home.dart';
import 'package:my_pantry/app/modules/notification/widgets/card_notification_widget.dart';
import 'package:my_pantry/app/routes/detailnotif_routes.dart';
import 'notification_controller.dart';

// Halaman untuk menampilkan notifikasi
class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      child: Column(
                        children: [
                          // Spacing atas
                          const SizedBox(height: 16),
                          // Tombol kembali dengan ikon
                          InkWell(
                            onTap: () {
                              // Navigasi kembali ke halaman sebelumnya
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
                          const SizedBox(height: 16),
                          // Widget yang reaktif menggunakan Obx
                          Obx(() {
                            // Tampilkan pesan jika tidak ada data
                            if (controller.expiredItems.isEmpty) {
                              return Expanded(
                                child: Center(
                                  child: Text(
                                    'Tidak ada data',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              );
                            }

                            // Tampilkan loading indicator saat memuat data
                            if (controller.isLoading.value) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.freshgreen,
                                ),
                              );
                            }

                            // Tampilkan daftar item yang kadaluwarsa
                            return RefreshIndicator(
                              onRefresh: () async {
                                await controller.onRefreshExpiredItems();
                              },
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.expiredItems.length,
                                itemBuilder: (context, index) {
                                  final data = controller.expiredItems[index];
                                  return CardNotificationWidget(
                                    categoryName: data.categoryName,
                                    image: data.imageUrl,
                                    expiredCount: data.expiredCount,
                                    onPressed: () {
                                      // Navigasi ke halaman detail notifikasi
                                      Get.toNamed(
                                        DetailnotifRoutes.detailnotif,
                                        arguments: data,
                                      );
                                    },
                                  ).paddingOnly(bottom: 8);
                                },
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Widget footer kustom
            bottomNavigationBar: const CustomFooterHome(),
          );
        });
  }
}
