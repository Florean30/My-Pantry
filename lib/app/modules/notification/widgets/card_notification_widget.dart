import 'package:flutter/material.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';

// Widget untuk menampilkan kartu notifikasi
class CardNotificationWidget extends StatelessWidget {
  // Parameter yang diperlukan untuk widget
  final String categoryName;
  final String image;
  final int expiredCount;
  final void Function()? onPressed;

  // Constructor widget
  const CardNotificationWidget({
    super.key,
    required this.categoryName,
    required this.image,
    required this.expiredCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Membuat card dengan warna latar belakang hijau muda
    return Card(
      color: AppColors.lightgreen,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Menggunakan Expanded untuk mengisi ruang yang tersedia
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menampilkan judul kategori
                  Text(
                    categoryName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Baris untuk menampilkan informasi dan gambar
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
                                text: expiredCount.toString(),
                                style: const TextStyle(
                                  color: AppColors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                  text:
                                      ' macam bahan makanan dikategori ini yang kadaluwarsa.'),
                            ],
                          ),
                        ),
                      ),
                      // Widget untuk menampilkan gambar kategori
                      Expanded(
                        child: Container(
                          height: 120.0,
                          decoration: BoxDecoration(
                            // Menampilkan gambar dari URL
                            image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                            ),
                            // Memberikan border radius pada gambar
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
                    // Mengatur style tombol
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
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
