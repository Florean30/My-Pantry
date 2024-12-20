import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class HeaderBackWidget extends StatelessWidget {
  const HeaderBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.deepwhite,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              'assets/images/icon/back.png', 
              width: 35, 
              height: 35,
            ),
          ),
        ],
      ),
    );
  }
}