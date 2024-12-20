import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'addjenis_controller.dart';

class AddjenisPage extends GetView<AddjenisController> {
  const AddjenisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddjenisPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddjenisPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
