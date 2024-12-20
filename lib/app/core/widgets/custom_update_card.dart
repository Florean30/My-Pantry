import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class CustomUpdateCard extends StatelessWidget {
  final String title;
  final int count;
  final String imagePath;

  const CustomUpdateCard({
    super.key,
    required this.title,
    required this.count,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.lightgreen,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                  ),
                ),
                const SizedBox(height: 38),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                    ),
                    children: [
                      const TextSpan(text: 'Anda mempunyai '),
                      TextSpan(
                        text: count.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.orange,
                        ),
                      ),
                      const TextSpan(text: ' macam\nbahan makanan dijenis ini.'),
                    ],
                  ),
                ),
                const SizedBox(height: 31),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: const Size(75, 30),
                  ),
                  child: const Text(
                    'Lihat',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.asset(
              imagePath,
              width: 135,
              height: 125,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}