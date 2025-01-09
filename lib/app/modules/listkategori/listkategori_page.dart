import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/core/widgets/custom_footer_home.dart';
import 'package:my_pantry/app/routes/kelola_routes.dart';
import 'listkategori_controller.dart';

// Halaman untuk menampilkan daftar kategori bahan makanan
class ListkategoriPage extends GetView<ListkategoriController> {
  const ListkategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Tombol kembali ke halaman sebelumnya
            SafeArea(
              child: InkWell(
                onTap: () => Get.back(),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                children: [
                  // Menampilkan nama kategori
                  Obx(() {
                    return Text(
                      controller.category.value?.nameCategory ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
                  const SizedBox(width: 30),
                  // Menampilkan jumlah bahan makanan dalam kategori
                  Expanded(
                    child: Obx(() {
                      return RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                          ),
                          children: [
                            const TextSpan(text: 'Anda mempunyai '),
                            TextSpan(
                              text: controller.getStoragesLength().toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.orange,
                              ),
                            ),
                            const TextSpan(
                                text: ' macam bahan makanan dikategori ini.'),
                          ],
                        ),
                      );
                    }),
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
            const SizedBox(height: 10),
            // Widget pencarian bahan makanan
            searchDropdown(),
            const SizedBox(height: 15),
            // Daftar bahan makanan dalam kategori
            Expanded(
              child: Obx(() {
                // Menampilkan loading indicator saat memuat data
                if (controller.isLoading.value) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.orange,
                  ));
                }
                // Menampilkan pesan jika tidak ada data
                if (controller.category.value!.storages.isEmpty) {
                  return const Center(
                    child: Text(
                      'Tidak ada data bahan makanan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                // Menampilkan daftar bahan makanan
                return RefreshIndicator(
                  backgroundColor: AppColors.freshgreen,
                  color: Colors.white,
                  onRefresh: () async {
                    await controller.onRefresh();
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Column(
                      // Generate daftar bahan makanan
                      children: List.generate(
                        controller.category.value!.storages.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            color: controller.category.value!.storages[index]
                                        .quantity <
                                    5
                                ? const Color.fromARGB(255, 251, 240, 141)
                                : AppColors.lightgreen,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Nama jenis bahan makanan
                                  Row(
                                    children: [
                                      Text(
                                        controller.category.value!
                                            .storages[index].name,
                                        style: const TextStyle(
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
                                        Get.toNamed(
                                          KelolaRoutes.kelola,
                                          arguments: [
                                            // Mengirimkan id storage, id kategori, dan nama kategori
                                            controller.category.value!
                                                .storages[index].id,
                                            controller.category.value!.id,
                                            controller
                                                .category.value!.nameCategory,
                                          ],
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.orange,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
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
                );
              }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orange,
        onPressed: () {
          Get.toNamed(
            KelolaRoutes.kelola,
            arguments: [
              controller.category.value!.id,
              controller.category.value!.nameCategory,
            ],
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      bottomNavigationBar: const CustomFooterHome(),
    );
  }

  // Widget untuk pencarian bahan makanan
  Widget searchDropdown() {
    return SizedBox(
      height: 45,
      width: Get.width - 50,
      child: SearchAnchor(
        // Membangun search bar
        builder: (BuildContext context, SearchController searchController) {
          return SearchBar(
            controller: searchController,
            textStyle:
                const WidgetStatePropertyAll(TextStyle(color: AppColors.white)),
            backgroundColor: const WidgetStatePropertyAll(AppColors.orange),
            hintText: "Cari bahan makanan",
            hintStyle:
                const WidgetStatePropertyAll(TextStyle(color: AppColors.white)),
            padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 20.0)),
            onChanged: (value) {
              searchController.openView();
            },
            onTap: () {
              searchController.openView();
            },
            trailing: const <Widget>[
              Icon(Icons.search, color: AppColors.white)
            ],
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          );
        },
        viewConstraints: const BoxConstraints(maxHeight: 250),
        // Membangun daftar saran pencarian
        suggestionsBuilder:
            (BuildContext context, SearchController searchController) {
          return List.generate(controller.category.value!.storages.length,
              (int index) {
            final data = controller.category.value!.storages[index];
            return ListTile(
              title: Text(data.name),
              onTap: () {
                searchController.closeView(data.name);
                Get.toNamed(
                  KelolaRoutes.kelola,
                  arguments: [
                    // Mengirimkan id storage, id kategori, dan nama kategori
                    controller.category.value!.storages[index].id,
                    controller.category.value!.id,
                    controller.category.value!.nameCategory,
                  ],
                );
              },
            );
          });
        },
        isFullScreen: false,
      ),
    );
  }
}
