import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/widgets/custom_footer_home.dart';
import 'package:mypantry_app/app/core/widgets/custom_kategori_grid.dart';
import 'package:mypantry_app/app/routes/addkategori_routes.dart';

import 'home_controller.dart';

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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(color: AppColors.white),
              cursorColor: AppColors.white,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                hintText: 'Bumbu kering',
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

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tambahkan jenis bahan',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
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
                            ' Yuk!',
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AddkategoriRoutes.addkategori);
                  },
                  child: Image.asset(
                    'assets/images/icon/add.png',
                    width: 80,
                  ),
                ),
              ],
            ),

            const Divider(
              color: AppColors.darkgreen,
              thickness: 4,
              indent: 20,
              endIndent: 20,
            ),
            // KategoriGrid(),
            const SizedBox(height: 10),
            // Kategori Grid section
            Container(
                padding: const EdgeInsets.only(left: 8),
                width: MediaQuery.sizeOf(context).width,
                height: 170,
                child: const CustomKategoriGrid()),
            const SizedBox(height: 10),
            const Divider(
              color: AppColors.darkgreen,
              thickness: 4,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(height: 4),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Last Update ',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '!',
                  style: TextStyle(
                    color: AppColors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Column(
              children: List.generate(dummyUpdate.length, (index) {
                final data = dummyUpdate[index];
                return CustomCardUpdate(
                    title: data['title'],
                    stock: data['stock'],
                    image: data['image']);
              }),
            ),

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

class CustomCardUpdate extends StatelessWidget {
  final String title;
  final int stock;
  final String image;

  const CustomCardUpdate({
    super.key,
    required this.title,
    required this.stock,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightgreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: AppColors.black,
                            ),
                            children: [
                              const TextSpan(text: 'Anda mempunyai '),
                              TextSpan(
                                text: stock.toString(),
                                style: const TextStyle(
                                  color: AppColors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                  text: ' macam bahan makanan dijenis ini.'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 120.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                image,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Lihat"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List dummyUpdate = [
  {
    'title': 'Sayuran',
    'stock': 30,
    'image': 'assets/images/kategori/sayur.jpg',
  },
  {
    'title': 'Bumbu Kering',
    'stock': 24,
    'image': 'assets/images/kategori/kering.jpg',
  },
  {
    'title': 'Bumbu Basah',
    'stock': 20,
    'image': 'assets/images/kategori/basah.jpg',
  },
  {
    'title': 'Lauk Pauk',
    'stock': 50,
    'image': 'assets/images/kategori/lauk.jpg',
  },
  {
    'title': 'Buah-buahan',
    'stock': 33,
    'image': 'assets/images/kategori/buah.jpg',
  },
];