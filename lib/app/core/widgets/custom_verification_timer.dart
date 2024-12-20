import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class VerificationTimer extends StatefulWidget {
  const VerificationTimer({Key? key}) : super(key: key);

  @override
  _VerificationTimerState createState() => _VerificationTimerState();
}

class _VerificationTimerState extends State<VerificationTimer> {
  late Timer _timer;
  int _remainingSeconds = 300; // 5 minutes in seconds

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String get timerText {
    int minutes = _remainingSeconds ~/ 60;
    int seconds = _remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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