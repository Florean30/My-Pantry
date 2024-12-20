import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:mypantry_app/app/routes/login_routes.dart';
import 'reset_controller.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/widgets/custom_password_input.dart';


class ResetPage extends GetView<ResetController> {
  const ResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.deepwhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/icon/back.png',
            width: 38,
            height: 38,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    'New Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.deepblack,
                      
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                CustomPasswordInput(
                  label: 'New Password',
                  hintText: '',
                  controller: controller.passwordController,
      
                  validator: (value) => controller.validatePassword(value),
                ),
                const SizedBox(height: 16),
                CustomPasswordInput(
                  label: 'Confirm Password',
                  controller: controller.confirmPasswordController,
                  hintText: '',
                  validator: (value) => controller.validateConfirmPassword(value),
                ),
                const SizedBox(height: 32),
                Obx(() => SizedBox(
                  width: double.infinity,
                  height: 50,

                  
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed(LoginRoutes.login);
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
              ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}