import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/core/widgets/custom_footer_home.dart';
import 'package:my_pantry/app/core/widgets/custom_loading_image.dart';
import 'package:my_pantry/app/modules/home/widgets/custom_card_item.dart';
import 'package:my_pantry/app/routes/add_category_routes.dart';
import 'package:my_pantry/app/routes/listkategori_routes.dart';
import 'package:my_pantry/app/routes/notification_routes.dart';
import 'package:my_pantry/app/routes/profile_routes.dart';
import 'home_controller.dart';

// Halaman utama untuk menampilkan daftar kategori bahan makanan
class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(NotificationRoutes.notification);
            // Get.toNamed(NotifRoutes.notif);
          },
          child: Image.asset(
            'assets/icon/notif.png',
            width: 60,
            height: 60,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(ProfileRoutes.profile);
            },
            child: Image.asset(
              'assets/icon/logo.png',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.darkgreen,
            ),
          );
        }
        return RefreshIndicator(
          backgroundColor: AppColors.freshgreen,
          color: Colors.white,
          onRefresh: () async {
            await controller.onRefresh();
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Widget TextField untuk pencarian
                searchDropdown(),

                const SizedBox(height: 30),
                // Row untuk menampilkan judul dan ikon tambah
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Teks "Tambahkan kategori bahan"
                          Text(
                            'Tambahkan kategori bahan',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Row untuk teks "makanan. Yuk!"
                          Row(
                            children: [
                              Text(
                                'makanan.',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' Yuk!',
                                style: TextStyle(
                                  color: AppColors.orange,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: FloatingActionButton(
                        mini: true,
                        backgroundColor: AppColors.orange,
                        onPressed: () {
                          Get.toNamed(AddCategoryRoutes.addCategory);
                        },
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                // Garis pemisah atas
                const Divider(
                  color: AppColors.darkgreen,
                  thickness: 4,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 10),

                SizedBox(
                  height: 170,
                  child: categoryCarousel(),
                ),

                const SizedBox(height: 10),

                // Garis pemisah bawah
                const Divider(
                  color: AppColors.darkgreen,
                  thickness: 4,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 4),

                // Row untuk judul "Last Update!"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // log(box.read("TOKEN").toString());
                        controller.getCategory();
                      },
                      child: const Text(
                        'Last Update ',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      '!',
                      style: TextStyle(
                        color: AppColors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                // Column untuk menampilkan daftar update terakhir
                Obx(() {
                  return Column(
                    children:
                        List.generate(controller.categories.length, (index) {
                      final data = controller.categories[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CustomCardUpdate(
                          title: data.nameCategory,
                          stock:
                              data.storages.isEmpty ? 0 : data.storages.length,
                          image: data.picture,
                          onPressed: () {
                            Get.toNamed(
                              ListkategoriRoutes.listkategori,
                              arguments: data.id,
                            );
                          },
                        ),
                      );
                    }),
                  );
                }),
              ],
            ),
          ),
        );
      }),
      // Widget footer untuk navigasi
      bottomNavigationBar: const CustomFooterHome(),
    );
  }

  categoryCarousel() {
    return Obx(() {
      return ListView.builder(
        padding: const EdgeInsets.only(left: 5),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            // Dekorasi container utama dengan gradient transparan ke hijau
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color.fromARGB(200, 0, 100, 0),
                ],
                stops: [0.6, 1.0],
              ),
            ),
            width: 250,
            margin: const EdgeInsets.only(right: 12),
            // Stack untuk menumpuk gambar, gradient, dan teks
            child: Stack(
              children: [
                // Layer 1: Gambar kategori yang mengisi seluruh container
                Positioned.fill(
                  child: Image.network(
                    controller.categories[index].picture,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: LoadingImageWidget(),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error, color: Colors.red),
                            SizedBox(height: 4),
                            Text(
                              "Gagal memuat gambar",
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // Layer 2: Gradient overlay untuk memberikan efek gelap pada gambar
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.darkgreen.withValues(alpha: 0.1),
                          AppColors.darkgreen.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                  ),
                ),
                // Layer 3: Teks judul kategori di bagian bawah
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      controller.categories[index].nameCategory,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  SearchAnchor searchDropdown() {
    return SearchAnchor(
      builder: (BuildContext context, SearchController searchController) {
        return SearchBar(
          controller: searchController,
          textStyle:
              const WidgetStatePropertyAll(TextStyle(color: AppColors.white)),
          backgroundColor: const WidgetStatePropertyAll(AppColors.orange),
          hintText: "Cari kategori bahan",
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
          trailing: const <Widget>[Icon(Icons.search, color: AppColors.white)],
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        );
      },
      viewConstraints: const BoxConstraints(maxHeight: 270),
      suggestionsBuilder:
          (BuildContext context, SearchController searchController) {
        return List.generate(controller.categories.length, (int index) {
          final data = controller.categories[index];
          return ListTile(
            title: Text(data.nameCategory),
            onTap: () {
              searchController.closeView(data.nameCategory);
              Get.toNamed(
                ListkategoriRoutes.listkategori,
                arguments: data.id,
              );
            },
          );
        });
      },
      isFullScreen: false,
    );
  }
}
