import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class CustomFooterHome extends StatelessWidget {
  const CustomFooterHome({super.key});

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
              'assets/images/icon/activity.png',
              width: 65, 
              height: 65,
              fit: BoxFit.contain,
              semanticLabel: 'Activity',
            ),
            Image.asset(
              'assets/images/icon/home.png',
              width: 50,
              height: 50, 
              fit: BoxFit.contain,
              semanticLabel: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}