import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: 250,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: GoogleFonts.nunito(
                    color: AppColors.black,
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: AppColors.lightgreen,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 13),
          const Center(
            child: Text(
              'A code will be sent to your email.',
              style: TextStyle(
                fontFamily: 'Nunito',
                color: AppColors.black,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}