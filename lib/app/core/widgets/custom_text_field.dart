import 'package:flutter/material.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.label,
    this.initialValue,
    this.isPassword = false,
    this.keyboardType,
    required this.controller,
    this.suffixIcon, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.orange,
                fontSize: 12,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: initialValue,
            obscureText: isPassword,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFC8E6C9),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 13,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              suffixIcon: suffixIcon,
              
            ),
          ),
        ],
      ),
    );
  }
}