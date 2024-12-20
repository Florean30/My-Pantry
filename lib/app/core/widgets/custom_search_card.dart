import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/data/models/jenis_item.dart';

class CustomSearchCard extends StatelessWidget { 
  final JenisItem jenis; 
  final VoidCallback onTap;

  const CustomSearchCard({
    super.key,
    required this.jenis, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 328),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(15),
            border: jenis.isSelected
                ? Border.all(color: AppColors.white, width: 2)
                : null,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  jenis.title, 
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 45),
              Image.network(
                'assets/images/icon/search.png',
                width: 30,
                height: 35,
                fit: BoxFit.contain,
                semanticLabel: '${jenis.title} illustration',
              ),
            ],
          ),
        ),
      ),
    );
  }
}