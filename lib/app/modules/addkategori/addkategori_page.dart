import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'addkategori_controller.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class AddKategoriPage extends StatefulWidget {
  const AddKategoriPage({super.key});

  @override
  State<AddKategoriPage> createState() => AddKategoriPageState();
}

class AddKategoriPageState extends State<AddKategoriPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 95, 16, 537),
          child: Column(
            children: [
              Text(
                'Tambah Jenis Bahan\nMakanan',
                style: const TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.fromLTRB(7, 16, 7, 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFC8E6C9),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 192,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama : Umbi-umbian',
                              style: const TextStyle(
                                color: Color(0xFF212121),
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                Text(
                                  'Gambar :',
                                  style: const TextStyle(
                                    color: Color(0xFF212121),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                    vertical: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFF3F3),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Add Photo',
                                    style: const TextStyle(
                                      color: Color(0xFF3D3D3D),
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: Image.network(
                                    'https://cdn.builder.io/api/v1/image/assets/TEMP/17906973ea5d41d4e30807e2f78ed119a940ff42f1e79f6d468916beb6b105c8?placeholderIfAbsent=true&apiKey=e915180113584dff873c474d1c0b12f9',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 13),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Handle save
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF5722),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            minimumSize: const Size(61, 26),
                          ),
                          child: const Text(
                            'Save',
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
            ],
          ),
        ),
      ),
    );
  }
}