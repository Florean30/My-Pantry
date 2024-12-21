import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class CustomKategoriItemGrid extends StatelessWidget {
  final String imagePath; 
  final String title;

  const CustomKategoriItemGrid({
    super.key,
    required this.imagePath, 
    required this.title,
  }); 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color.fromARGB(200, 0, 100, 0), 
                ],
                stops: [0.6, 1.0],
              ),
      ),
      margin: const EdgeInsets.only(right: 12),
      width: 180,
      child: Stack(
        
        children: [
         Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.darkgreen.withOpacity(0.1),
                    AppColors.darkgreen.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}