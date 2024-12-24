import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypantry_app/app/core/theme/app_color.dart';
import 'package:mypantry_app/app/core/extensions/date_time_ext.dart';
import 'package:mypantry_app/app/data/models/kelola/aktivitas_kelola.dart';
import 'package:mypantry_app/app/data/models/kelola/penyimpanan_kelola.dart';
import 'package:mypantry_app/app/data/models/kelola/jumlah_kelola.dart';

// Widget untuk menampilkan dropdown form pengelolaan item
class CustomDropdownKelolaItem extends StatefulWidget {
  const CustomDropdownKelolaItem({super.key});

  @override
  CustomDropdownKelolaItemState createState() =>
      CustomDropdownKelolaItemState();
}

class CustomDropdownKelolaItemState extends State<CustomDropdownKelolaItem> {
  // Controller untuk mengelola input dari setiap field
  final TextEditingController activityController = TextEditingController();
  final TextEditingController activityDateController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController storageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            const Text(
              "Sayuran",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),

            // Menampilkan nama item
            const Row(
              children: [
                Expanded(child: Text('Nama')),
                Text(':'),
                Expanded(child: Text('Tomat')),
              ],
            ),

            // Dropdown untuk memilih aktivitas
            buildDropdownField(
              controller: activityController,
              label: 'Aktivitas',
              onTap: () => showDropdownDialog(
                title: 'Pilih Aktivitas',
                items: Activity.values.map((e) => e.name).toList(),
                controller: activityController,
              ),
            ),

            // Field untuk memilih tanggal aktivitas
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Tanggal Aktivitas',
                  ),
                ),
                const Text(':'),
                Expanded(
                  child: Text(activityDateController.text),
                ),
                IconButton(
                  icon: Image.asset('assets/images/icon/select.png'),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      activityDateController.text =
                          pickedDate.toFormattedDate();
                    }
                  },
                ),
              ],
            ),

            // Field untuk memilih tanggal kadaluarsa
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Tanggal Kadaluarsa',
                  ),
                ),
                const Text(':'),
                Expanded(
                  child: Text(expiryDateController.text),
                ),
                IconButton(
                  icon: Image.asset('assets/images/icon/select.png'),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      expiryDateController.text = pickedDate.toFormattedDate();
                    }
                  },
                ),
              ],
            ),

            // Dropdown untuk memilih kuantitas dengan enum Quantity
            buildDropdownField(
              controller: quantityController,
              label: 'Quantity',
              onTap: () => showDropdownDialog(
                title: 'Pilih Quantity',
                items: Quantity.values.map((e) => e.name).toList(),
                controller: quantityController,
              ),
            ),

            // Dropdown untuk memilih tempat penyimpanan
            buildDropdownField(
              controller: storageController,
              label: 'Storage',
              onTap: () => showDropdownDialog(
                title: 'Pilih Storage',
                items: Storage.values.map((e) => e.name).toList(),
                controller: storageController,
              ),
            ),

            // Tombol Save
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
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
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk membuat field dropdown yang dapat dikustomisasi
  Widget buildDropdownField({
    required TextEditingController controller,
    required String label,
    required VoidCallback onTap,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
          ),
        ),
        const Text(':'),
        Expanded(
          child: Text(controller.text),
        ),
        IconButton(
          icon: Image.asset('assets/images/icon/select.png'),
          onPressed: onTap,
        ),
      ],
    );
  }

  // Fungsi untuk menampilkan dialog dropdown
  void showDropdownDialog({
    required String title,
    required List<String> items,
    required TextEditingController controller,
  }) {
    showDialog(
      context: context,
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
