import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';

// Widget untuk input kode verifikasi dengan 6 digit
class VerificationCodeInput extends StatefulWidget {
  const VerificationCodeInput({super.key});

  @override
  VerificationCodeInputState createState() => VerificationCodeInputState();
}

class VerificationCodeInputState extends State<VerificationCodeInput> {
  // Membuat 6 controller untuk mengontrol input text
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  // Membuat 6 focus node untuk mengatur fokus antar input
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  // Membersihkan controller dan focus node saat widget dihapus
  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // Membuat 6 kotak input
      children: List.generate(
        6,
        (index) => Container(
          width: 40,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            // Konfigurasi tampilan input
            decoration: InputDecoration(
              // Border saat input tidak aktif
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.freshgreen,
                  width: 1,
                ),
              ),
              // Border saat input aktif
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.freshgreen,
                  width: 1,
                ),
              ),
              // Padding dalam input
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 18,
              ),
            ),
            textAlign: TextAlign.center,
            keyboardType:
                TextInputType.number, // Hanya menampilkan keyboard angka
            // Pembatasan input
            inputFormatters: [
              LengthLimitingTextInputFormatter(1), // Maksimal 1 karakter
              FilteringTextInputFormatter.digitsOnly, // Hanya menerima angka
            ],
            // Pindah fokus ke input berikutnya saat diisi
            onChanged: (value) {
              if (value.isNotEmpty && index < 5) {
                _focusNodes[index + 1].requestFocus();
              }
            },
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
