import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/routes/home_routes.dart';

import 'addjenis_controller.dart';

class AddjenisPage extends GetView<AddjenisController> {
  const AddjenisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/icon/back.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 41),
          const Center(
            child: Text(
              'Tambah Jenis Bahan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
          ),
          const Center(
            child: Text(
              'Makanan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Divider(
              color: AppColors.darkgreen,
              thickness: 3,
            ),
          ),
          const SizedBox(height: 10),
          Card(
            margin: EdgeInsets.all(15),
            color: AppColors.lightgreen,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text('Nama', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                      Text(': Umbi-umbian', style: TextStyle(fontSize: 16)),
                      
                    ],
                  ),
                  const Row(
                    children: [
                      Text('Add Photo', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                      Text(': Umbi-umbian', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: 
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(300),
                        ),
                      ),
                      onPressed: () { 
                        Get.offNamed(HomeRoutes.home);
                      },
                      child: const Text('Save', style: TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
