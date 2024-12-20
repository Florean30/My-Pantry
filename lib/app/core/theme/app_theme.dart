import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

ThemeData myTheme = ThemeData(
  useMaterial3: false,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.freshgreen,
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: AppColors.freshgreen,
  ),
  textTheme: GoogleFonts.nunitoTextTheme(),
  primaryColor: AppColors.black,
  scaffoldBackgroundColor: Colors.white,
);