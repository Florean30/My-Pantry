import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class CustomHeaderHome extends StatelessWidget {
  const CustomHeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: AppColors.freshgreen,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/icon/notif.png',
              width: 40, 
              height: 40,
              fit: BoxFit.contain,
              semanticLabel: 'Notifikasi',
            ),
            Image.asset(
              'assets/images/icon/logo.png',
              width: 40,
              height: 40, 
              fit: BoxFit.contain,
              semanticLabel: 'Logo',
            ),
          ],
        ),
      ),
    );
  }
}