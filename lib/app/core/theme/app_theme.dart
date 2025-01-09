import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';

// Konfigurasi tema utama aplikasi
ThemeData myTheme = ThemeData(
  // Menonaktifkan Material 3 untuk konsistensi desain
  useMaterial3: false,

  // Mengatur tema AppBar dengan warna latar freshgreen
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.freshgreen,
  ),

  // Mengatur tema BottomAppBar dengan warna latar freshgreen
  bottomAppBarTheme: const BottomAppBarTheme(
    color: AppColors.freshgreen,
  ),

  // Menggunakan font Nunito dari Google Fonts untuk seluruh teks
  textTheme: GoogleFonts.nunitoTextTheme(),

  // Mengatur warna primer aplikasi menjadi hitam
  primaryColor: AppColors.black,

  // Mengatur warna latar belakang scaffold menjadi putih
  scaffoldBackgroundColor: AppColors.deepwhite,
);
