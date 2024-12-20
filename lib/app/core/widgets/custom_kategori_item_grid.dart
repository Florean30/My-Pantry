import 'package:flutter/material.dart';

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
            bottom: 11,
            left: 11,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}