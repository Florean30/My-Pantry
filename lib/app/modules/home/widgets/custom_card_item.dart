import 'package:flutter/material.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/core/widgets/custom_loading_image.dart';

class CustomCardUpdate extends StatelessWidget {
  // Variabel untuk menyimpan judul kategori
  final String? title;
  // Variabel untuk menyimpan jumlah stok
  final int? stock;
  // Variabel untuk menyimpan URL gambar
  final String? image;
  // Fungsi untuk menangani tombol yang ditekan
  final void Function()? onPressed;

  // Constructor untuk menginisialisasi widget
  const CustomCardUpdate({
    super.key,
    this.title,
    this.stock,
    this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Membuat kartu dengan latar hijau cerah
    return Card(
      color: AppColors.lightgreen,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menampilkan judul kategori
                  Text(
                    title ?? '',
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
                                text: (stock ?? 0).toString(),
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
                        child: Card(
                          elevation: 2,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: Image.network(
                            height: 135.0,
                            fit: BoxFit.cover,
                            image ??
                                "https://res.cloudinary.com/dotz74j1p/image/upload/v1715660683/no-image.jpg",
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: LoadingImageWidget(),
                              );
                            },
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
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
                    onPressed: onPressed,
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
