import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/routes/editprofile_routes.dart';
import 'package:mypantry_app/app/routes/login_routes.dart';
import 'profile_controller.dart';
import 'package:mypantry_app/app/core/widgets/custom_text_field.dart';
import 'package:mypantry_app/app/core/widgets/custom_submit_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColors.deepwhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: controller.formKey, // Tambahkan form key
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              const Center(
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Image.asset(
                  'assets/images/icon/profile.png',
                  width: 110,
                  height: 110,
                ),
              ),
              CustomTextField(
                label: 'Name',
                controller: controller.nameController,
                validator: controller.validateName,
              ),
              CustomTextField(
                label: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: controller.validateEmail,
              ),
              
              const SizedBox(height: 138),
              
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(EditprofileRoutes.editprofile);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.orange,
                        ),
                      ),
                      Image.asset(
                        'assets/images/icon/edit.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(LoginRoutes.login);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.orange,
                        ),
                      ),
                         Image.asset(
                        'assets/images/icon/logout.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
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
