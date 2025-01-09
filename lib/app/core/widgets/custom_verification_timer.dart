import 'package:flutter/material.dart';
import 'dart:async';
import 'package:my_pantry/app/core/theme/app_color.dart';

// Widget untuk menampilkan timer verifikasi
class VerificationTimer extends StatefulWidget {
  const VerificationTimer({super.key});

  @override
  VerificationTimerState createState() => VerificationTimerState();
}

class VerificationTimerState extends State<VerificationTimer> {
  // Deklarasi variabel timer
  late Timer _timer;
  // Waktu awal timer (5 menit dalam detik)
  int _remainingSeconds = 300;

  @override
  void initState() {
    super.initState();
    // Memulai timer saat widget diinisialisasi
    startTimer();
  }

  // Fungsi untuk memulai timer countdown
  void startTimer() {
    // Membuat timer yang berjalan setiap 1 detik
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // Mengurangi waktu jika masih lebih dari 0
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          // Menghentikan timer jika waktu habis
          _timer.cancel();
        }
      });
    });
  }

  // Fungsi untuk memformat waktu menjadi string MM:SS
  String get timerText {
    // Menghitung menit dan detik
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    // Mengembalikan string format "MM:SS" dengan padding 0
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    // Membersihkan timer saat widget dihapus
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Membangun widget Text untuk menampilkan timer
    return Text(
      timerText,
      style: const TextStyle(
        fontSize: 18,
        color: AppColors.deepblack,
      ),
      textAlign: TextAlign.center,
    );
  }
}
