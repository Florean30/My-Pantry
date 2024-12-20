import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class SayuranItem {
  final String name;
  
  SayuranItem({required this.name});
}

class VegetableItemWidget extends StatelessWidget {
  final SayuranItem vegetable;
  final VoidCallback? onKelolaPressed; // Menambahkan callback untuk tombol Kelola

  const VegetableItemWidget({
    super.key, 
    required this.vegetable,
    this.onKelolaPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4), // Menambahkan margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: AppColors.freshgreen,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Memperbesar padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded( // Membungkus Text dengan Expanded
            child: Text(
              vegetable.name,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
              ),
              semanticsLabel: '${vegetable.name} vegetable',
              overflow: TextOverflow.ellipsis, // Menambahkan overflow
            ),
          ),
          GestureDetector( // Membungkus tombol dengan GestureDetector
            onTap: onKelolaPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.orange,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: const SizedBox(
                width: 51,
                height: 16,
                child: Center(
                  child: Text(
                    'Kelola',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

