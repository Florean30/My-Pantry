import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'listkategori_controller.dart';

class ListkategoriPage extends GetView<ListkategoriController> {
  const ListkategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListkategoriPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListkategoriPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
