import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_pantry/app/core/theme/app_color.dart';
import 'package:my_pantry/app/core/widgets/custom_footer_home.dart';
import 'package:my_pantry/app/core/widgets/custom_text_field.dart';
import 'package:my_pantry/app/data/models/kelola/aktivitas_kelola.dart';
import 'package:my_pantry/app/data/models/kelola/jumlah_kelola.dart';
import 'package:my_pantry/app/data/models/kelola/penyimpanan_kelola.dart';
import 'kelola_controller.dart';

// Halaman untuk mengelola bahan makanan
class KelolaPage extends GetView<KelolaController> {
  const KelolaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body menggunakan SingleChildScrollView agar konten bisa di scroll
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // Widget SafeArea untuk memastikan konten tidak tertutup notch/status bar
            SafeArea(
              // InkWell untuk membuat area yang bisa di tap
              child: InkWell(
                // Fungsi untuk kembali ke halaman sebelumnya saat tombol back ditekan
                onTap: () {
                  Get.back();
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/icon/back.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Widget untuk menampilkan form kelola item
            GetBuilder<KelolaController>(builder: (controller) {
              return Obx(() {
                // Menampilkan loading indicator saat data sedang diproses
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.freshgreen,
                    ),
                  );
                }

                // Form utama untuk input data kelola
                return Card(
                  color: AppColors.lightgreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Judul kategori item
                        InkWell(
                          onTap: () async {
                            // DateTime? pickedDate = await showDatePicker(
                            //   context: context,
                            //   initialDate: DateTime.now(),
                            //   firstDate: DateTime(2000),
                            //   lastDate: DateTime(2100),
                            // );
                            // log("pickedDate: ${pickedDate?.toIso8601String()}");
                            log(controller.activityDateController.text);
                          },
                          child: Text(
                            controller.isEditMode
                                ? controller.storage.value?.category
                                        ?.nameCategory ??
                                    ''
                                : controller.args?[1] ?? '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Menampilkan nama item
                        Row(
                          children: [
                            const Expanded(child: Text('Nama')),
                            const Text(':'),
                            // Expanded(
                            //   child: Text(" ${controller.storage.value?.name}"),
                            // ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CustomSimpleTextForm2(
                                constraints:
                                    const BoxConstraints(maxHeight: 45),
                                label: "",
                                isFilled: false,
                                controller: controller.nameController,
                              ),
                            ),
                            const SizedBox(width: 26)
                          ],
                        ),
                        const SizedBox(height: 4.0),

                        // Dropdown untuk memilih aktivitas
                        buildDropdownField(
                          controllerText: controller.activityController,
                          label: 'Aktivitas',
                          onTap: () => showDropdownDialog(
                            title: 'Pilih Aktivitas',
                            items: Activity.values.map((e) => e.name).toList(),
                            controller: controller.activityController,
                          ),
                        ),
                        const SizedBox(height: 4.0),

                        // Field untuk memilih tanggal aktivitas
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Tanggal Aktivitas',
                              ),
                            ),
                            const Text(':'),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CustomSimpleTextForm(
                                enabled: false,
                                constraints:
                                    const BoxConstraints(maxHeight: 45),
                                label: "",
                                isFilled: false,
                                controller: controller.activityDateController,
                              ),
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: AppColors.orange,
                                          onPrimary: Colors.white,
                                          onSurface: Colors.black,
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: AppColors.orange,
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (pickedDate != null) {
                                  controller.activityDateController.text =
                                      "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                                }
                              },
                              child: Image.asset(
                                'assets/icon/select.png',
                                width: 22,
                                height: 22,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),

                        // Field untuk memilih tanggal kadaluwarsa
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Kadaluwarsa',
                              ),
                            ),
                            const Text(':'),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CustomSimpleTextForm(
                                enabled: false,
                                constraints:
                                    const BoxConstraints(maxHeight: 45),
                                label: "",
                                isFilled: false,
                                controller: controller.expiryDateController,
                              ),
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: AppColors.orange,
                                          onPrimary: Colors.white,
                                          onSurface: Colors.black,
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: AppColors.orange,
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (pickedDate != null) {
                                  controller.expiryDateController.text =
                                      "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
                                }
                              },
                              child: Image.asset(
                                'assets/icon/select.png',
                                width: 22,
                                height: 22,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),

                        Row(
                          children: [
                            Expanded(
                              flex: controller.isEditMode ? 2 : 1,
                              child: const Text(
                                'Jumlah',
                              ),
                            ),
                            const SizedBox(width: 28),
                            const Text(':'),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CustomSimpleTextForm2(
                                enabled: !controller.isEditMode,
                                constraints:
                                    const BoxConstraints(maxHeight: 45),
                                label: "",
                                isFilled: false,
                                controller: controller.quantityController,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(controller.unitController.text),
                            const SizedBox(width: 5),
                            Visibility(
                              visible: controller.isEditMode,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Material(
                                  elevation: 2,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.decrementQuantity();
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          size: 14.0,
                                        ),
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        controller.quantity.value.toString(),
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(width: 4.0),
                                      InkWell(
                                        onTap: () {
                                          controller.incrementQuantity();
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          size: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () async {
                                showDropdownDialog(
                                  title: 'Pilih Satuan',
                                  items: Quantity.values
                                      .map((e) => e.name)
                                      .toList(),
                                  controller: controller.unitController,
                                  controllerKelola: controller,
                                );
                              },
                              child: Image.asset(
                                'assets/icon/select.png',
                                width: 22,
                                height: 22,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 4.0),

                        // Dropdown untuk memilih tempat penyimpanan
                        buildDropdownField(
                          controllerText: controller.storageController,
                          label: 'Penyimpanan',
                          onTap: () => showDropdownDialog(
                            title: 'Pilih Storage',
                            items:
                                StorageEnum.values.map((e) => e.name).toList(),
                            controller: controller.storageController,
                          ),
                        ),

                        // Tombol Save
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Visibility(
                              visible: controller.isEditMode,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.onDeleteStorageById();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  minimumSize: const Size(61, 26),
                                ),
                                child: const Text(
                                  'Hapus',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            ElevatedButton(
                              onPressed: () {
                                controller.onSavePressed();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                minimumSize: const Size(61, 26),
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
            }),
            const SizedBox(height: 24),
          ],
        ),
      ),
      // Widget footer custom di bagian bawah
      bottomNavigationBar: const CustomFooterHome(),
    );
  }

  // Helper widget untuk membuat field dropdown yang dapat dikustomisasi
  Widget buildDropdownField({
    TextEditingController? controllerText,
    required String label,
    required VoidCallback onTap,
    int? quantity,
    bool? isQuantity,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
          ),
        ),
        SizedBox(width: isQuantity == true ? 60 : 1),
        const Text(':'),
        const SizedBox(width: 5),
        Expanded(
          child: CustomSimpleTextForm(
            enabled: false,
            constraints: const BoxConstraints(maxHeight: 45),
            label: "",
            isFilled: false,
            controller: controllerText,
          ),
        ),
        Visibility(
          visible: isQuantity == true,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Material(
              elevation: 2,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.decrementQuantity();
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 14.0,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    quantity.toString(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 4.0),
                  InkWell(
                    onTap: () {
                      controller.incrementQuantity();
                    },
                    child: const Icon(
                      Icons.add,
                      size: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: onTap,
          child: Image.asset(
            'assets/icon/select.png',
            width: 22,
            height: 22,
          ),
        ),
      ],
    );
  }

  // Fungsi untuk menampilkan dialog pemilihan item dropdown
  void showDropdownDialog({
    required String title,
    required List<String> items,
    required TextEditingController controller,
    KelolaController? controllerKelola,
  }) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SizedBox(
            width: double.minPositive,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index]),
                  onTap: () {
                    controller.text = items[index];
                    Navigator.pop(context);
                    controllerKelola?.update();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
