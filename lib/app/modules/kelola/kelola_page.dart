import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'kelola_controller.dart';
import 'package:mypantry_app/app/core/widgets/custom_kelola_item.dart';

class KelolaPage extends GetView<KelolaController> {
  const KelolaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CustomDropdownKelolaItem(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.submitKelola,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}