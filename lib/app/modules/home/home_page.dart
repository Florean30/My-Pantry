import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'package:mypantry_app/app/routes/profile_routes.dart';
import 'package:mypantry_app/app/routes/notif_routes.dart';
import 'package:mypantry_app/app/routes/addkategori_routes.dart';
import 'package:mypantry_app/app/routes/listkategori_routes.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/widgets/custom_kategori_grid.dart';
import 'package:mypantry_app/app/core/widgets/custom_footer_home.dart';

// Halaman utama
class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(NotifRoutes.notif);
          },
          child: Image.asset(
            'assets/images/icon/notif.png',
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
              'assets/images/icon/logo.png',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Widget TextField untuk pencarian
            TextField(
              style: const TextStyle(color: AppColors.white),
              cursorColor: AppColors.white,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                // Teks placeholder
                hintText: 'Bumbu kering',
                // Mengatur style untuk teks placeholder
                hintStyle: const TextStyle(color: AppColors.white),
                // Mengatur border default
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: AppColors.orange,
                  ),
                ),
                // Mengatur border saat TextField tidak aktif
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: AppColors.orange,
                  ),
                ),
                // Mengatur border saat TextField aktif/fokus
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: AppColors.orange,
                  ),
                ),
                // Menambahkan ikon pencarian di akhir TextField
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
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: FloatingActionButton(
                    backgroundColor: AppColors.orange,
                    onPressed: () {
                      Get.toNamed(AddkategoriRoutes.addkategori);
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

            // Container untuk grid kategori
            Container(
                padding: const EdgeInsets.only(left: 8),
                width: MediaQuery.sizeOf(context).width,
                height: 170,
                child: const CustomKategoriGrid()),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Last Update ',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '!',
                  style: TextStyle(
                    color: AppColors.orange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Column untuk menampilkan daftar update terakhir
            Column(
              children: List.generate(dummyUpdate.length, (index) {
                final data = dummyUpdate[index];
                return CustomCardUpdate(
                    title: data['title'],
                    stock: data['stock'],
                    image: data['image']);
              }),
            ),
          ],
        ),
      ),
      // Widget footer untuk navigasi
      bottomNavigationBar: const CustomFooterHome(),
    );
  }
}

// Widget untuk menampilkan kartu update dengan informasi bahan makanan
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menampilkan judul kategori
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      // Widget untuk menampilkan teks informasi stok
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: AppColors.black,
                            ),
                            children: [
                              const TextSpan(text: 'Anda mempunyai '),
                              // Menampilkan jumlah stok dengan warna orange
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
                      // Widget untuk menampilkan gambar kategori
                      Expanded(
                        child: Container(
                          height: 120.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Tombol untuk melihat detail kategori
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(ListkategoriRoutes.listkategori);
                    },
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

// Data dummy untuk menampilkan daftar kategori bahan makanan
List dummyUpdate = [
  // Data kategori Sayuran
  {
    'title': 'Sayuran',
    'stock': 30,
    'image': 'assets/images/kategori/sayur.jpg',
  },
  // Data kategori Bumbu Kering
  {
    'title': 'Bumbu Kering',
    'stock': 24,
    'image': 'assets/images/kategori/kering.jpg',
  },
  // Data kategori Bumbu Basah
  {
    'title': 'Bumbu Basah',
    'stock': 20,
    'image': 'assets/images/kategori/basah.jpg',
  },
  // Data kategori Lauk Pauk
  {
    'title': 'Lauk Pauk',
    'stock': 50,
    'image': 'assets/images/kategori/lauk.jpg',
  },
  // Data kategori Buah-buahan
  {
    'title': 'Buah-buahan',
    'stock': 33,
    'image': 'assets/images/kategori/buah.jpg',
  },
];
