import 'package:flutter/material.dart';
import 'dart:io';

// Widget kustom untuk memilih gambar
class ImagePicker extends StatelessWidget {
  // Path gambar yang dipilih
  final String imagePath;
  // Fungsi yang akan dijalankan saat widget di tap
  final VoidCallback onTap;

  const ImagePicker({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget GestureDetector untuk mendeteksi tap
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        // Dekorasi container dengan warna abu-abu dan border radius
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        // Conditional rendering berdasarkan imagePath
        child: imagePath.isEmpty
            // Tampilan default ketika tidak ada gambar dipilih
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Pilih Gambar',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            // Tampilan ketika ada gambar yang dipilih
            : ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
