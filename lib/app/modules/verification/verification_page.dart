import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:mypantry_app/app/routes/reset_routes.dart';
import 'verification_controller.dart';
import 'package:mypantry_app/app/core/widgets/custom_verification_timer.dart';
import 'package:mypantry_app/app/core/widgets/custom_verification_code_input.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';

class VerificationPage extends GetView<VerificationController> {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepwhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/icon/back.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 41),
              Center(
                child: const Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepblack,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              const SizedBox(height: 59),
              Center(child: const VerificationTimer()),
              const SizedBox(height: 22),
              const VerificationCodeInput(),
              const SizedBox(height: 22),
              Center(
                child: Text(
                  'Enter your code from the email we send you',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              const SizedBox(height: 164),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.offNamed(ResetRoutes.reset);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(150, 40),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.deepwhite,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
              ),
              
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "I didn't receive the code! ",
                          style: TextStyle(
                            color: AppColors.deepblack,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                          ),
                        ),
                        TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                            color: AppColors.deepblack,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.deepblack,
                            decorationThickness: 2,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}