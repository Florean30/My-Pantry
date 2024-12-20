import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'home_controller.dart';
import 'package:mypantry_app/app/data/models/jenis_item.dart';
import 'package:mypantry_app/app/core/widgets/custom_header_home.dart';
import 'package:mypantry_app/app/core/widgets/custom_search_card.dart';
import 'package:mypantry_app/app/core/widgets/custom_kategori_grid.dart';
import 'package:mypantry_app/app/core/widgets/custom_kategori_item_grid.dart';
import 'package:mypantry_app/app/core/widgets/custom_update_card.dart';
import 'package:mypantry_app/app/core/widgets/custom_update_list.dart';
import 'package:mypantry_app/app/core/widgets/custom_footer_home.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/icon/notif.png',
          width: 30,
          height: 30,
        ),
        actions: [
          Image.asset(
            'assets/images/icon/logo.png',
            width: 35,
            height: 35,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Bumbu kering',
                hintStyle: const TextStyle(color: AppColors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.orange,
                  ),
                ),
                suffixIcon: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(
                    Icons.search,
                    color: AppColors.white,
                    size: 30,
                  ),
                ),
                filled: true,
                fillColor: AppColors.orange,
              ),
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tambahkan jenis bahan',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Row(
                        children: [
                          Text(
                            'makanan.',
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Yuk!',
                            style: TextStyle(
                              color: AppColors.orange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/icon/add.png',
                  width: 90,
                  height: 90,
                ),
              ],
            ),

            Divider(
              color: AppColors.darkgreen,
              thickness: 3,
            ),

            // KategoriGrid(),

            const SizedBox(height: 20),
            // // Kategori Grid section
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0),
            //   child: CustomKategoriGrid(),
            // ),

            // // Update Card section
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            //   child: CustomUpdateCard(title: 'Update', count: 10, imagePath: 'assets/images/kategori/buah.png'),
            // ),

            // // Update List section
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0),
            //   child: CustomUpdateList(),
            // ),

            // // Item Grid section
            // const Padding(
            //   padding: EdgeInsets.all(16.0),
            //   child: CustomKategoriItemGrid(
            //     imagePath: 'assets/kategori/',
            //     title: '',
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomFooterHome(),
    );
  }
}
